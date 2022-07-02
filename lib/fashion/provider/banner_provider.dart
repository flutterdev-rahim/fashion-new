import 'package:bpp_shop/fashion/model/Fashion_Model/banner_model.dart';
import 'package:flutter/material.dart';

import '../Api_Service/banner_service.dart';


//import 'package:bpp_shop/fashion/model/Fashion_Model/banner_model.dart';

class BannerProvider extends ChangeNotifier {
  List<Banners> bannerList=[];
bool isLoading=false;
  getBannerProvide(context) async {
    isLoading=true;
    final data = await BannerService().getBannerService();

    bannerList = data.banner!;
    isLoading=false;

    notifyListeners();
  }
}
