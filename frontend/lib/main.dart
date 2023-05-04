import 'package:flutter/material.dart';
import 'package:frontend/controllers/popular_product_controller.dart';
import 'package:frontend/controllers/recomended_product_controller.dart';
import 'package:frontend/routes/route_helper.dart';
import 'package:frontend/screens/cart/cart_page.dart';
import 'package:frontend/screens/home/main_page.dart';
import 'package:get/get.dart';
import 'helper/dependencies.dart' as dep;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecomendedProductController>().getRecomendedProductList();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MR MD',
      home: const CartPage(),
      //initialRoute: RouteHelper.initial,
      //getPages: RouteHelper.routes,
    );
  }
}
