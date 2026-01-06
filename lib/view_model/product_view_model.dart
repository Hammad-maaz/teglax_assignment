import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teglax_assignment/models/category/category_model.dart';
import 'package:teglax_assignment/models/product/product_model.dart';
import 'package:teglax_assignment/network/api_url.dart';
import 'package:teglax_assignment/res/services/dio.dart';

class ProductViewModel extends GetxController {
  RxList<ProductModel> productList = <ProductModel>[].obs;
  RxList<CategoryModel> categories = <CategoryModel>[].obs;
  RxString selectedCategory = ''.obs;
  Rx<TextEditingController> searchController = TextEditingController().obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
    fetchCategories();
  }

  Future<List<ProductModel>> fetchProducts() async {
    try {
      final response = await ApiService().getData(ApiUrls.allProducts);
      final decoded = response!.data;
      productList.clear();

      for (var i in decoded['products']) {
        productList.add(ProductModel.fromJson(i));
      }

      debugPrint("Products Fetched: ${productList.length}");
      return productList;
    } catch (error) {
      debugPrint("Product Error: $error");
      return [];
    }
  }

  Future<List<CategoryModel>> fetchCategories() async {
    try {
      final response = await ApiService().getData(ApiUrls.categories);
      final List<dynamic> data = response!.data;
      categories.assignAll(data.map((e) => CategoryModel.fromJson(e)).toList());
      debugPrint("Categories Fetched: ${categories.length}");
      return categories;
    } catch (error) {
      debugPrint("Categories Error: $error");
      return [];
    }
  }

  Future<List<ProductModel>> fetchProductsByCategory(String category) async {
    try {
      final response = await ApiService()
          .getData('${ApiUrls.allProducts}/category/$category');
      final decoded = response!.data;
      productList.clear();

      for (var i in decoded['products']) {
        productList.add(ProductModel.fromJson(i));
      }

      debugPrint("Products Fetched for $category: ${productList.length}");
      return productList;
    } catch (error) {
      debugPrint("Product Error: $error");
      return [];
    }
  }

  void selectCategory(CategoryModel? category) {
    selectedCategory.value = category?.slug ?? '';
    if (category == null) {
      fetchProducts();
    } else {
      fetchProductsByCategory(category.slug);
    }
  }
}
