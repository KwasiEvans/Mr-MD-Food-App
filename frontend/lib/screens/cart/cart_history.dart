import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/controllers/cart_controller.dart';
import 'package:frontend/utils/colors.dart';
import 'package:frontend/utils/dimentions.dart';
import 'package:frontend/widgets/app_icon.dart';
import 'package:frontend/widgets/big_text.dart';
import 'package:get/get.dart';

class CartHistory extends StatelessWidget {
  const CartHistory({super.key});

  @override
  Widget build(BuildContext context) {
    var getCartHistoryList = Get.find<CartController>().getCartHistoryList();
    Map<String, int> cartItemsPerOrder = Map();

    for (int i = 0; i < getCartHistoryList.length; i++) {
      if (cartItemsPerOrder.containsKey(getCartHistoryList[i].time)) {
        cartItemsPerOrder.update(
            getCartHistoryList[i].time!, (value) => ++value);
      } else {
        cartItemsPerOrder.putIfAbsent(getCartHistoryList[i].time!, () => 1);
      }
    }

    List<int> cartOrderTimeToList() {
      return cartItemsPerOrder.entries.map((e) => e.value).toList();
    }

    List<int> itemsPerOrder = cartOrderTimeToList();

    var ListCounter = 0;

    return Scaffold(
      body: Column(children: [
        Container(
          height: 66,
          color: AppColors.mainColor,
          width: double.maxFinite,
          padding: const EdgeInsets.only(top: 10),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            BigText(text: "Cart History", color: Colors.white),
            const AppIcon(
              icon: FontAwesomeIcons.shoppingCart,
              iconColor: AppColors.mainColor,
              backgroundColor: AppColors.yellowColor,
            )
          ]),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(
                top: Dimensions.height20,
                left: Dimensions.width20,
                right: Dimensions.width20),
            child: ListView(
              children: [
                for (int i = 0; i < itemsPerOrder.length; i++)
                  Container(
                    margin: EdgeInsets.only(bottom: Dimensions.height20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BigText(text: "05/05/2023"),
                        Row(
                          children: [
                            Wrap(
                                direction: Axis.horizontal,
                                children:
                                    List.generate(itemsPerOrder[i], (index) {
                                  return Container(
                                    child: Text("Hello"),
                                  );
                                })),
                          ],
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
