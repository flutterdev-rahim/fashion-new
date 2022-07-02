import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bpp_shop/models/bpp/select_address_model.dart';
import 'package:bpp_shop/view_model/bpp/local_storage_service.dart';
LocalStorageStore localStorageStore=LocalStorageStore();
Future<DelivaryAddress> getSelectAddressData(String addressId) async {
  final token=await localStorageStore.getUserToken();
  var response = await http.get(
      Uri.parse(
        "https://bppshops.com/api/checkout/info/select/check/${addressId}",
      ),
      headers: {
        'Content-type': 'application/json',
        'Authorization': "Bearer ${token}",
      });
  if (response.statusCode == 200){
    final json = jsonDecode(response.body);
    print(response.body);
    SelectAddress selectAddressData =SelectAddress.fromJson(json);
    return selectAddressData.address!;
  }
  else {

    throw Exception('Failed to load address');
  }
}