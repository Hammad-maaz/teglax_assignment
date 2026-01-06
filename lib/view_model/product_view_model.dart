import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teglax_assignment/models/product/product_model.dart';
import 'package:teglax_assignment/network/api_url.dart';
import 'package:teglax_assignment/res/services/dio.dart';

class ProductViewModel extends GetxController {
  RxList<ProductModel> productList = <ProductModel>[].obs;

  Future<List<ProductModel>> fetchProducts() async {
    try {
      final response = await ApiService().getData(ApiUrls.allProducts);
      final decoded = response!.data;
      productList.clear();

      for (var i in decoded['products']) {
        productList.add(ProductModel.fromJson(i));
      }

      return productList;
    } catch (error) {
      debugPrint("Product Error: $error");
      return [];
    }
  }
}
