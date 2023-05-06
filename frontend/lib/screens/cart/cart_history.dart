import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/controllers/cart_controller.dart';
import 'package:frontend/utils/app_constants.dart';
import 'package:frontend/utils/colors.dart';
import 'package:frontend/utils/dimentions.dart';
import 'package:frontend/widgets/app_icon.dart';
import 'package:frontend/widgets/big_text.dart';
import 'package:frontend/widgets/small_text.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CartHistory extends StatelessWidget {
  const CartHistory({super.key});

  @override
  Widget build(BuildContext context) {
    var getCartHistoryList =
        Get.find<CartController>().getCartHistoryList().reversed.toList();
    // ignore: prefer_collection_literals
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

    // ignore: non_constant_identifier_names
    var ListCounter = 0;

    return Scaffold(
      body: Column(children: [
        Container(
          height: Dimensions.height10 * 7,
          color: AppColors.mainColor,
          width: double.maxFinite,
          padding: EdgeInsets.only(top: Dimensions.height10),
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
            child: MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: ListView(
                children: [
                  for (int i = 0; i < itemsPerOrder.length; i++)
                    Container(
                      height: Dimensions.height30 * 4,
                      margin: EdgeInsets.only(bottom: Dimensions.height20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          (() {
                            DateTime parseDate =
                                DateFormat("yyyy-MM-dd HH:mm:ss").parse(
                                    getCartHistoryList[ListCounter].time!);
                            var inputDate =
                                DateTime.parse(parseDate.toString());
                            var outputFormat = DateFormat("dd/MM/yyyy hh:mm a");
                            var outputDate = outputFormat.format(inputDate);
                            return BigText(text: outputDate);
                          }()),
                          SizedBox(height: Dimensions.height10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Wrap(
                                direction: Axis.horizontal,
                                children: List.generate(
                                  itemsPerOrder[i],
                                  (index) {
                                    if (ListCounter <
                                        getCartHistoryList.length) {
                                      ListCounter++;
                                    }
                                    return index <= 2
                                        ? Container(
                                            height: Dimensions.height20 * 4,
                                            width: Dimensions.height20 * 4,
                                            margin: EdgeInsets.only(
                                                right: Dimensions.width10 / 2),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      Dimensions.radius15 / 2),
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(AppConstants
                                                        .BASE_URL +
                                                    AppConstants.UPLOAD_URL +
                                                    getCartHistoryList[
                                                            ListCounter - 1]
                                                        .img!),
                                              ),
                                            ),
                                          )
                                        : Container();
                                  },
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  print("tapped");
                                },
                                child: Container(
                                  height: Dimensions.height20 * 4,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      SmallText(
                                          text: "Total",
                                          color: AppColors.titleColor),
                                      BigText(
                                        text: "${itemsPerOrder[i]} Items",
                                        color: AppColors.titleColor,
                                      ),
                                      Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: Dimensions.width10,
                                              vertical:
                                                  Dimensions.height10 / 2),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      Dimensions.radius15 / 3),
                                              border: Border.all(
                                                  width: 1,
                                                  color: AppColors.mainColor)),
                                          child: Row(
                                            children: [
                                              SmallText(
                                                text: "one more",
                                                color: AppColors.titleColor,
                                              ),
                                              SizedBox(
                                                  width:
                                                      Dimensions.width10 - 5),
                                              const Icon(
                                                FontAwesomeIcons.shoppingBasket,
                                                color: AppColors.iconColor1,
                                              )
                                            ],
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}
