import 'package:get/get.dart';
import 'package:teglax_assignment/view_model/product_details_view_model.dart';
import 'package:teglax_assignment/view_model/product_view_model.dart';

class ProductBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(ProductViewModel());
  }
}

class ProductDetailsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductDetailsViewModel());
  }
}
