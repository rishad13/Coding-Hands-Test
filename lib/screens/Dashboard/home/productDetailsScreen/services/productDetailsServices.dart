import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../../../core/appUrls.dart';
import '../model/productDetailsModel.dart';

class ProductDetailsScreenServices extends ChangeNotifier {
  Future<ProductDetailsModal> productDetailsApi() async {
    final response = await http.get(Uri.parse(AppUrls.productDetailsApi));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      notifyListeners();
      return ProductDetailsModal.fromJson(data);
    } else {
      notifyListeners();
      throw Exception('Failed to load');
    }
  }
}
