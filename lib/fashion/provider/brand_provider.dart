import 'package:bpp_shop/fashion/Api_Service/brand_service.dart';
import 'package:flutter/material.dart';

import '../model/Fashion_Model/brand_model.dart';

class BrandProvider extends ChangeNotifier{
  List<Brand> brandList=[];
  bool isLoading=false;
  getBrandProvider(context)async{
    isLoading=true;
    var data= await BrandService().getBrandService();
    brandList=data.brands!;
    print('Brand Length ${brandList.length}');
    isLoading=false;
 notifyListeners();
  }
}