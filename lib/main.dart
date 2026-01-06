import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:teglax_assignment/res/routes/routes.dart';
import 'package:teglax_assignment/res/routes/routes_names.dart';
import 'package:teglax_assignment/res/services/bindings.dart';
import 'package:teglax_assignment/res/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: ProductBindings(),
      title: 'Flutter Demo',
      theme: ThemeData(
          useMaterial3: true, scaffoldBackgroundColor: AppColors.white),
      initialRoute: RoutesNames.splash,
      getPages: Routes.pages,
    );
  }
}
