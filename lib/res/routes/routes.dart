import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:teglax_assignment/res/routes/routes_names.dart';
import 'package:teglax_assignment/res/services/bindings.dart';
import 'package:teglax_assignment/views/product_dashboard.dart';
import 'package:teglax_assignment/views/product_details.dart';
import '../../views/splash.dart';

class Routes {
  static final List<GetPage> pages = [
    GetPage(name: RoutesNames.splash, page: () => Splash()),
    GetPage(name: RoutesNames.dashboard, page: () => Dashboard()),
    GetPage(
        name: RoutesNames.productDetails,
        page: () => ProductDetails(),
        binding: ProductDetailsBindings()),
  ];
}
