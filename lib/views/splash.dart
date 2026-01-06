import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teglax_assignment/res/routes/routes_names.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Timer(Duration(milliseconds: 1500), () {
      Get.offNamed(RoutesNames.dashboard);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Teglax, Okara',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
