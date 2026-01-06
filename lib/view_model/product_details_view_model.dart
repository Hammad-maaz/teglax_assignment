import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teglax_assignment/models/product_details_model/product_details_model.dart';
import 'package:teglax_assignment/network/api_url.dart';
import 'package:teglax_assignment/res/services/dio.dart';

class ProductDetailsViewModel extends GetxController {
  /// Fetch product details by ID
  Future<ProductDetailsModel?> fetchProductDetails(int id) async {
    try {
      final response = await ApiService().getData('${ApiUrls.allProducts}/$id');
      final decoded = response!.data;

      return ProductDetailsModel.fromJson(decoded);
    } catch (e) {
      debugPrint("Product Details Error: $e");
      return null;
    }
  }
}
