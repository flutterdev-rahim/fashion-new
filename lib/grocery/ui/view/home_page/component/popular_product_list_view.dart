import 'package:bpp_shop/bpp/provider/cart_provider.dart';
import 'package:bpp_shop/grocery/ui/view/home_page/component/home_page_titles.dart';
import 'package:bpp_shop/models/grocery/most_popular.dart';
import 'package:bpp_shop/view_model/grocery/http_popular.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import '../../../constant/app_colors.dart';

class PopularProductListView extends StatelessWidget {
  const PopularProductListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);
    return FutureBuilder(
        future:getGroceryPopularData(),
    builder: (BuildContext context, AsyncSnapshot snapshot) {
    if (snapshot.hasData) {
    List<GroceryMostPopularAll> get = snapshot.data ??
    <GroceryMostPopularAll>[];
    return Column(
      children: [
        CustomHomePageTitles(
          leadingTitle: "Popular",
          trailingTitle: "See All",
        ),
        SizedBox(
          height: 250,
          width: MediaQuery.of(context).size.width,
          child: ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, i) {
              return Padding(
                padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                child: ListTile(
                  tileColor: tertiaryColor1,
                  leading: SizedBox(
                    width: 50,
                    height: 50,
                    child:get[i].productThambnail!= null?  Image.network(
                      "https://bppshops.com/${get[i].productThambnail}",
                      fit: BoxFit.cover,
                    ):Image.network('https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg'),
                  ),
                  title: Text(
                   " ${get[i].productName}",
                    style: TextStyle(
                      fontSize: 16,
                      color: titleFontColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  subtitle: Text(get[i].total.toString()
                   // item.productQuantity.toString(),
                  ),
                  trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: primaryColor),
                        child: GestureDetector(
                          onTap: (){
                            cart.addItem(
                                get[i].productId!,
                                double.tryParse(get[i].sellingPrice!)! ,
                                get[i].productName,
                                "https://bppshops.com/${get[i].productThambnail}",
                                1

                              // widget.productId!,
                              // widget.productPrice!,
                              // widget.productName.toString(),
                              // widget.productImage.toString(),
                              // widget.qty,
                            );
                          },
                          child: Icon(
                            Icons.add_shopping_cart_outlined,
                            color: tertiaryColor1,
                            size: 18,
                          ),
                        ),
                      ),
                      Container(
                        width: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('??? ${double.tryParse(get[i].sellingPrice!)?.toStringAsFixed(1)}',
                              //item.productPrice.toString(),
                              style: TextStyle(
                                color: primaryColor,
                              ),
                            ),
                            Text('??? ${double.tryParse(get[i].discountPrice!)?.toStringAsFixed(1)}',
                              //item.productPrice.toString(),
                              style: TextStyle(
                                color: Colors.red,decoration: TextDecoration.lineThrough
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 10,
              );
            },
            itemCount: get.length,
          ),
        ),
      ],
    );
    }
    else{
      return     Column(
        children: [
          Shimmer(
            duration: Duration(seconds: 2), //Default value
            interval:
            Duration(seconds: 1), //Default value: Duration(seconds: 0)
            color: Colors.black, //Colors.grey.shade700, //Default value
            colorOpacity: 0, //Default value
            enabled: true, //Default value
            direction: ShimmerDirection.fromLTRB(),
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              height: 30,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ),
          Shimmer(
            duration: Duration(seconds: 2), //Default value
            interval:
            Duration(seconds: 1), //Default value: Duration(seconds: 0)
            color: Colors.black, //Colors.grey.shade700, //Default value
            colorOpacity: 0, //Default value
            enabled: true, //Default value
            direction: ShimmerDirection.fromLTRB(),
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              height:50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ),
          Shimmer(
            duration: Duration(seconds: 2), //Default value
            interval:
            Duration(seconds: 1), //Default value: Duration(seconds: 0)
            color: Colors.black, //Colors.grey.shade700, //Default value
            colorOpacity: 0, //Default value
            enabled: true, //Default value
            direction: ShimmerDirection.fromLTRB(),
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ),
          Shimmer(
            duration: Duration(seconds: 2), //Default value
            interval:
            Duration(seconds: 1), //Default value: Duration(seconds: 0)
            color: Colors.black, //Colors.grey.shade700, //Default value
            colorOpacity: 0, //Default value
            enabled: true, //Default value
            direction: ShimmerDirection.fromLTRB(),
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ),
        ],
      );
    }
    }

    );
  }
}
