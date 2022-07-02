import 'dart:convert';
import 'package:bpp_shop/models/grocery/categories.dart';


import 'package:http/http.dart'as http;

Future<List<GCategory>?> getGroceryCategories() async {
  final response = await http
      .get(Uri.parse('https://bppshops.com/api/gs/CategoryView_2'));

  if (response.statusCode == 200) {
    final json=jsonDecode(response.body);
    print(response.body);
    GroceryCategories  gCategory =GroceryCategories .fromJson(json);
    return gCategory.category;

  } else {

    throw Exception('Failed to load');
  }

}