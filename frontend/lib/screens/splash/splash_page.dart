import 'dart:async';

import 'package:flutter/material.dart';
import 'package:frontend/controllers/popular_product_controller.dart';
import 'package:frontend/controllers/recomended_product_controller.dart';
import 'package:frontend/routes/route_helper.dart';
import 'package:frontend/utils/dimentions.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  Future<void> _loadResource() async {
    await Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecomendedProductController>().getRecomendedProductList();
  }

  @override
  void initState() {
    super.initState();
    _loadResource();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..forward();

    animation = CurvedAnimation(parent: controller, curve: Curves.easeInCubic);

    Timer(const Duration(seconds: 3),
        () => Get.offNamed(RouteHelper.getInitial()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
            scale: animation,
            child: Center(
              child: Image.asset("assets/images/logo.png",
                  width: Dimensions.splashImg),
            ),
          ),
          Center(
              child: Image.asset("assets/images/logo2.jpg",
                  width: Dimensions.splashImg))
        ],
      ),
    );
  }
}
