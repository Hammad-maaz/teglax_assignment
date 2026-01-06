import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:teglax_assignment/res/routes/routes_names.dart';
import '../../views/splash.dart';

class Routes {
  static final List<GetPage> pages = [
    GetPage(name: RoutesNames.splash, page: () => Splash()),
  ];
}