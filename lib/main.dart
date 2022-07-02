import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:bpp_shop/fashion/provider/banner_provider.dart';
import 'package:bpp_shop/fashion/provider/brand_provider.dart';
import 'package:bpp_shop/fashion/provider/hot_deals_provider.dart';
import 'package:bpp_shop/fashion/view/home_page%20copy.dart';
import 'package:bpp_shop/view/bpp/bottomAppBar/bottom_app_bar.dart';
import 'package:bpp_shop/view/bpp/bottomAppBar/history_screen/myOrder_provider.dart';
import 'package:bpp_shop/view/bpp/bottomAppBar/home_screen.dart';
import 'package:bpp_shop/view_model/bpp/app_provider.dart';
import 'package:page_transition/page_transition.dart';
import 'package:bpp_shop/bpp/provider/order_provider.dart';
import 'package:bpp_shop/grocery/core/controller/app_state_controller.dart';
import 'package:bpp_shop/grocery/core/controller/home_page_event_handeller.dart';
import 'package:bpp_shop/grocery/core/controller/order_history_event_handler.dart';
import 'package:bpp_shop/grocery/core/controller/product_detail_data_controller.dart';
import 'package:bpp_shop/bpp/provider/cart_provider.dart';
import 'package:bpp_shop/islamic/provider/model/order/track%20order/track%20order%20model%20class.dart';
import 'package:bpp_shop/islamic/provider/model/wishlist_provider.dart';
import 'package:bpp_shop/view/islamic/productDetails/product%20details.dart';
import 'package:country_code_picker/country_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

final List<String> imgList = [
  'images/bike.png',
  'images/headPhone.png',
  'images/phone.png',
  'images/food.png',
  'images/bike.png',
];
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //LocalStorageStore localStorageStore=LocalStorageStore();
    return MultiProvider(
      providers: [
//ChangeNotifierProvider<CategoriesProvide>(create: (BuildContext)=>CategoriesProvide()),

        //
        ChangeNotifierProvider.value(value: BppApps()),

        // ChangeNotifierProvider.value(value: Cancelled2()),
        // ChangeNotifierProvider.value(value: SubCategoriesProvide()),
        ChangeNotifierProvider.value(value: BannerProvider()),
        ChangeNotifierProvider.value(value: BrandProvider()),
        ChangeNotifierProvider.value(value: HotDealsProvider()),

        ChangeNotifierProvider.value(value: OrderTracking()),
        ChangeNotifierProvider.value(value: Cart()),
        ChangeNotifierProvider.value(value: Wish()),
        ChangeNotifierProvider.value(value: Order()),
        ChangeNotifierProvider.value(value: AppStateController()),
        ChangeNotifierProvider.value(
            value: ProductDetailDataController()), //MyFavouriteDataModel
        ChangeNotifierProvider.value(value: OrderHistoryEventHandler()),
        ChangeNotifierProvider.value(
            value: CustomScafoldKey()), //OrderHistoryEventHandler
        ChangeNotifierProvider.value(
            value: OrderHistoryEventHandler()), //CustomScafoldKey
        ChangeNotifierProvider.value(
            value: CustomScafoldKey()), //CustomScafoldKey
        ChangeNotifierProvider.value(
            value: MyOrderProvider()), //CustomScafoldKey
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 640),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            fontFamily: GoogleFonts.robotoSlab().fontFamily,
            scaffoldBackgroundColor: Colors.white,
            canvasColor: Colors.transparent,
            primarySwatch: Colors.amber,
          ),
          supportedLocales: [
            Locale("af"),
            Locale("am"),
            Locale("ar"),
            Locale("az"),
            Locale("be"),
            Locale("bg"),
            Locale("bn"),
            Locale("bs"),
            Locale("ca"),
            Locale("cs"),
            Locale("da"),
            Locale("de"),
            Locale("el"),
            Locale("en"),
            Locale("es"),
            Locale("et"),
            Locale("fa"),
            Locale("fi"),
            Locale("fr"),
            Locale("gl"),
            Locale("ha"),
            Locale("he"),
            Locale("hi"),
            Locale("hr"),
            Locale("hu"),
            Locale("hy"),
            Locale("id"),
            Locale("is"),
            Locale("it"),
            Locale("ja"),
            Locale("ka"),
            Locale("kk"),
            Locale("km"),
            Locale("ko"),
            Locale("ku"),
            Locale("ky"),
            Locale("lt"),
            Locale("lv"),
            Locale("mk"),
            Locale("ml"),
            Locale("mn"),
            Locale("ms"),
            Locale("nb"),
            Locale("nl"),
            Locale("nn"),
            Locale("no"),
            Locale("pl"),
            Locale("ps"),
            Locale("pt"),
            Locale("ro"),
            Locale("ru"),
            Locale("sd"),
            Locale("sk"),
            Locale("sl"),
            Locale("so"),
            Locale("sq"),
            Locale("sr"),
            Locale("sv"),
            Locale("ta"),
            Locale("tg"),
            Locale("th"),
            Locale("tk"),
            Locale("tr"),
            Locale("tt"),
            Locale("uk"),
            Locale("ug"),
            Locale("ur"),
            Locale("uz"),
            Locale("vi"),
            Locale("zh")
          ],
          localizationsDelegates: [
            CountryLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          //home:BottomNavBar(currentTab: 0,currentScreen: HomeScreen(),),
          // home:TrackOrder1(invoiceNumber: "27440811",),
          home: AnimatedSplashScreen(
              duration: 2000,
              splash: SizedBox(
                  height: 200,
                  width: 200,
                  child: Image.asset("assets/ic_launcher copy.png")),
              nextScreen: BottomNavBar(
                currentTab: 0,
                currentScreen: FashionHomePage(),
              ),
              splashTransition: SplashTransition.sizeTransition,
              pageTransitionType: PageTransitionType.leftToRight,
              backgroundColor: Colors.white),
          routes: {
            ProductDetails.routeName: (context) => ProductDetails(),
          },
        ),
      ),
    );
  }
}
