import 'package:flutter/material.dart';
import 'package:frontend/utils/colors.dart';
import 'package:frontend/utils/dimentions.dart';
import 'package:frontend/widgets/app_column.dart';
import 'package:frontend/widgets/app_icon.dart';
import 'package:frontend/widgets/big_text.dart';
import 'package:frontend/widgets/expendable_text.dart';
import 'package:frontend/widgets/icon_and_text.dart';
import 'package:frontend/widgets/small_text.dart';

class PopularFoodDtails extends StatelessWidget {
  const PopularFoodDtails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Background image
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.popularFoodImage,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    "assets/images/food1.jpeg",
                  ),
                ),
              ),
            ),
          ),
          // Icon Widget
          Positioned(
            top: Dimensions.height45,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  AppIcon(icon: Icons.arrow_back_ios),
                  AppIcon(icon: Icons.shopping_cart_outlined),
                ]),
          ),
          // Details of food
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimensions.popularFoodImage - 20,
            child: Container(
              padding: EdgeInsets.only(
                  left: Dimensions.width20,
                  right: Dimensions.width20,
                  top: Dimensions.height20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(Dimensions.radius20),
                    topLeft: Radius.circular(Dimensions.radius20),
                  ),
                  color: Colors.white),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppColumn(text: "MD's Pizza"),
                    SizedBox(height: Dimensions.height20),
                    BigText(text: "Details"),
                    SizedBox(height: Dimensions.height20),
                    const Expanded(
                      child: SingleChildScrollView(
                        child: ExpandableTextWidget(
                            text:
                                "Pizza is a popular Italian dish that consists of a flatbread base, tomato sauce, cheese, and a variety of toppings.\n\nThe base of a pizza is traditionally made from wheat flour, water, salt, and yeast, which is rolled out into a thin, circular shape.\n\nThe tomato sauce is typically made from ripe tomatoes, garlic, olive oil, and various herbs and spices, and is spread evenly over the pizza base.\n\nThe most common type of cheese used on pizza is mozzarella, although other types such as cheddar, Parmesan, and feta are also used.\n\nToppings on a pizza can vary widely, and may include meats such as pepperoni, sausage, ham, and bacon, as well as vegetables such as mushrooms, onions, peppers, and olives."),
                      ),
                    )
                  ]),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: Dimensions.bottonHeightBar,
        padding: EdgeInsets.only(
            top: Dimensions.height30,
            bottom: Dimensions.height30,
            left: Dimensions.width20,
            right: Dimensions.width20),
        decoration: BoxDecoration(
          color: AppColors.buttonBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.radius20 * 2),
            topRight: Radius.circular(Dimensions.radius20 * 2),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(
                  top: Dimensions.height20,
                  bottom: Dimensions.height20,
                  left: Dimensions.width20,
                  right: Dimensions.width20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Colors.white),
              child: Row(
                children: [
                  const Icon(Icons.remove, color: AppColors.signColor),
                  SizedBox(width: Dimensions.width10 / 2),
                  BigText(text: "0"),
                  SizedBox(width: Dimensions.width10 / 2),
                  const Icon(Icons.add, color: AppColors.signColor)
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  top: Dimensions.height20,
                  bottom: Dimensions.height20,
                  left: Dimensions.width20,
                  right: Dimensions.width20),
              // ignore: sort_child_properties_last
              child: BigText(
                text: "GH₵150 | Add to cart",
                color: Colors.white,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: AppColors.mainColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
