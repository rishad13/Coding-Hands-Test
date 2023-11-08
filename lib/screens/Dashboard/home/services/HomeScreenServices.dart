import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../../core/appUrls.dart';
import '../model/productListModel.dart';

class HomeScreenServices extends ChangeNotifier {
  Future<ProductListModal> productListApi() async {
    final response = await http.get(Uri.parse(AppUrls.productsApi));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      notifyListeners();
      return ProductListModal.fromJson(data);
    } else {
      notifyListeners();
      throw Exception('Failed to load');
    }
  }
}
