import 'package:flutter/material.dart';
import 'package:frontend/controllers/recomended_product_controller.dart';
import 'package:frontend/routes/route_helper.dart';
import 'package:frontend/utils/app_constants.dart';
import 'package:frontend/utils/colors.dart';
import 'package:frontend/utils/dimentions.dart';
import 'package:frontend/widgets/app_icon.dart';
import 'package:frontend/widgets/big_text.dart';
import 'package:frontend/widgets/expendable_text.dart';
import 'package:get/get.dart';

class RecomendedFoodDetail extends StatelessWidget {
  final int pageId;
  const RecomendedFoodDetail({
    Key? key,
    required this.pageId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<RecomendedProductController>().recomendedProductList[pageId];
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 90,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteHelper.getInitial());
                    },
                    child: const AppIcon(icon: Icons.clear)),
                AppIcon(icon: Icons.shopping_cart_outlined),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(20),
              child: Container(
                // ignore: sort_child_properties_last
                child: Center(
                    child:
                        BigText(size: Dimensions.font26, text: product.name)),
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
              background: Image.network(
                  AppConstants.BASE_URL + AppConstants.UPLOAD_URL + product.img,
                  width: double.maxFinite,
                  fit: BoxFit.cover),
            ),
          ),
          SliverToBoxAdapter(
              child: Column(
            children: [
              Container(
                // ignore: sort_child_properties_last
                child: ExpandableTextWidget(text: product.description),
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
                    text: "GH₵${product.price!}  X  0",
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
                    text: ("GH₵${product.price!} | Add to cart"),
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
