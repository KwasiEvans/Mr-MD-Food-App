// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:frontend/controllers/popular_product_controller.dart';
import 'package:frontend/controllers/recomended_product_controller.dart';
import 'package:frontend/screens/home/food_body.dart';
import 'package:frontend/utils/colors.dart';
import 'package:frontend/utils/dimentions.dart';
import 'package:frontend/widgets/big_text.dart';
import 'package:frontend/widgets/small_text.dart';
import 'package:get/get.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Future<void> _loadResource() async {
    await Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecomendedProductController>().getRecomendedProductList();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        child: Column(
          children: [
            // This is showing the header
            Container(
              margin: EdgeInsets.only(
                  top: Dimensions.height45, bottom: Dimensions.height15),
              padding: EdgeInsets.only(
                  left: Dimensions.width20, right: Dimensions.width20),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        BigText(
                          text: "Ghana",
                          color: AppColors.mainColor,
                        ),
                        Row(
                          children: [
                            SmallText(text: "Kasoa", color: Colors.black54),
                            const Icon(Icons.arrow_drop_down_rounded)
                          ],
                        ),
                      ],
                    ),
                    Center(
                      child: Container(
                        width: Dimensions.height45,
                        height: Dimensions.height45,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius15),
                          color: AppColors.mainColor,
                        ),
                        child: Icon(
                          Icons.search,
                          color: Colors.white,
                          size: Dimensions.iconSize24,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            // This is showing the body
            const Expanded(
              child: SingleChildScrollView(
                child: FoodPageBody(),
              ),
            )
          ],
        ),
        onRefresh: _loadResource,
      ),
    );
  }
}
