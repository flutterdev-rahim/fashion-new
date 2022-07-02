import 'package:bpp_shop/models/bpp/select_address_model.dart';
import 'package:bpp_shop/view_model/bpp/http_select_address.dart';
import 'package:flutter/material.dart';
class SelectAddressProvider extends ChangeNotifier{
  SelectAddress?selectedAddress;

  getSelctedAddress(String addressId)async{

    selectedAddress= (await getSelectAddressData(addressId)) as SelectAddress?;
    notifyListeners();
  }
}