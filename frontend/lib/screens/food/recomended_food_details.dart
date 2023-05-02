import 'package:flutter/material.dart';
import 'package:frontend/utils/colors.dart';
import 'package:frontend/utils/dimentions.dart';
import 'package:frontend/widgets/app_icon.dart';
import 'package:frontend/widgets/big_text.dart';
import 'package:frontend/widgets/expendable_text.dart';

class RecomendedFoodDetail extends StatelessWidget {
  const RecomendedFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 90,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                AppIcon(icon: Icons.clear),
                AppIcon(icon: Icons.shopping_cart_outlined),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(20),
              child: Container(
                // ignore: sort_child_properties_last
                child: Center(
                    child: BigText(size: Dimensions.font26, text: "MD's Side")),
                width: double.maxFinite,
                padding: const EdgeInsets.only(top: 5, bottom: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Dimensions.radius20),
                        topRight: Radius.circular(Dimensions.radius20))),
              ),
            ),
            pinned: true,
            backgroundColor: AppColors.mainColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset("assets/images/food0.jpg",
                  width: double.maxFinite, fit: BoxFit.cover),
            ),
          ),
          SliverToBoxAdapter(
              child: Column(
            children: [
              Container(
                child: ExpandableTextWidget(
                    text:
                        "Pizza is a popular Italian dish that consists of a flatbread base, tomato sauce, cheese, and a variety of toppings.\n\nThe base of a pizza is traditionally made from wheat flour, water, salt, and yeast, which is rolled out into a thin, circular shape.\n\nThe tomato sauce is typically made from ripe tomatoes, garlic, olive oil, and various herbs and spices, and is spread evenly over the pizza base.\n\nThe most common type of cheese used on pizza is mozzarella, although other types such as cheddar, Parmesan, and feta are also used.\n\nToppings on a pizza can vary widely, and may include meats such as pepperoni, sausage, ham, and bacon, as well as vegetables such as mushrooms, onions, peppers, and olives.\n\n"
                        "Pizza is a popular Italian dish that consists of a flatbread base, tomato sauce, cheese, and a variety of toppings.\n\nThe base of a pizza is traditionally made from wheat flour, water, salt, and yeast, which is rolled out into a thin, circular shape.\n\nThe tomato sauce is typically made from ripe tomatoes, garlic, olive oil, and various herbs and spices, and is spread evenly over the pizza base.\n\nThe most common type of cheese used on pizza is mozzarella, although other types such as cheddar, Parmesan, and feta are also used.\n\nToppings on a pizza can vary widely, and may include meats such as pepperoni, sausage, ham, and bacon, as well as vegetables such as mushrooms, onions, peppers, and olives.\n\n"
                        "Pizza is a popular Italian dish that consists of a flatbread base, tomato sauce, cheese, and a variety of toppings.\n\nThe base of a pizza is traditionally made from wheat flour, water, salt, and yeast, which is rolled out into a thin, circular shape.\n\nThe tomato sauce is typically made from ripe tomatoes, garlic, olive oil, and various herbs and spices, and is spread evenly over the pizza base.\n\nThe most common type of cheese used on pizza is mozzarella, although other types such as cheddar, Parmesan, and feta are also used.\n\nToppings on a pizza can vary widely, and may include meats such as pepperoni, sausage, ham, and bacon, as well as vegetables such as mushrooms, onions, peppers, and olives.\n\n"
                        "Pizza is a popular Italian dish that consists of a flatbread base, tomato sauce, cheese, and a variety of toppings.\n\nThe base of a pizza is traditionally made from wheat flour, water, salt, and yeast, which is rolled out into a thin, circular shape.\n\nThe tomato sauce is typically made from ripe tomatoes, garlic, olive oil, and various herbs and spices, and is spread evenly over the pizza base.\n\nThe most common type of cheese used on pizza is mozzarella, although other types such as cheddar, Parmesan, and feta are also used.\n\nToppings on a pizza can vary widely, and may include meats such as pepperoni, sausage, ham, and bacon, as well as vegetables such as mushrooms, onions, peppers, and olives."),
                margin: EdgeInsets.only(
                    left: Dimensions.width20, right: Dimensions.width20),
              ),
            ],
          )),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
                left: Dimensions.width20 * 2.5,
                right: Dimensions.width20 * 2.5,
                top: Dimensions.height10,
                bottom: Dimensions.height10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const AppIcon(
                    // iconSize: Dimensions.iconSize24,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    icon: Icons.remove),
                BigText(
                    text: "GH₵200 " + " X " + " 0",
                    color: AppColors.mainBlackColor,
                    size: Dimensions.font26),
                const AppIcon(
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    icon: Icons.add)
              ],
            ),
          ),
          Container(
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
                  child: const Icon(
                    Icons.favorite,
                    color: AppColors.mainColor,
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
                    text: "GH₵200 | Add to cart",
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
        ],
      ),
    );
  }
}
