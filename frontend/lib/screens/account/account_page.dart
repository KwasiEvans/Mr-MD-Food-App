import 'package:flutter/material.dart';
import 'package:frontend/base/custorm_loader.dart';
import 'package:frontend/controllers/auth_controller.dart';
import 'package:frontend/controllers/cart_controller.dart';
import 'package:frontend/controllers/user_controller.dart';
import 'package:frontend/routes/route_helper.dart';
import 'package:frontend/utils/colors.dart';
import 'package:frontend/utils/dimentions.dart';
import 'package:frontend/widgets/account_widget.dart';
import 'package:frontend/widgets/app_icon.dart';
import 'package:frontend/widgets/big_text.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool _userLoggedIn = Get.find<AuthController>().userLoggedIn();
    if (_userLoggedIn) {
      Get.find<UserController>().getUserInfo();
    }
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.mainColor,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: BigText(
            text: "Account Info",
            size: 24,
            color: Colors.white,
          ),
        ),
        body: GetBuilder<UserController>(builder: (userController) {
          return _userLoggedIn
              ? (userController.isLoading
                  ? Container(
                      width: double.maxFinite,
                      margin: EdgeInsets.only(top: Dimensions.height20),
                      child: Column(
                        children: [
                          AppIcon(
                            icon: Icons.person,
                            backgroundColor: AppColors.mainColor,
                            iconColor: Colors.white,
                            iconSize: Dimensions.height45 + Dimensions.height30,
                            size: Dimensions.height15 * 10,
                          ),
                          SizedBox(height: Dimensions.height30),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  // phone
                                  AccountWidget(
                                    appIcon: AppIcon(
                                      icon: LineAwesomeIcons.phone,
                                      backgroundColor: AppColors.iconColor2,
                                      iconColor: Colors.white,
                                      iconSize: Dimensions.height10 * 5 / 2,
                                      size: Dimensions.height10 * 5,
                                    ),
                                    bigText: BigText(
                                        text: userController.userModel.phone),
                                  ),
                                  SizedBox(height: Dimensions.height20),
                                  // Name
                                  AccountWidget(
                                    appIcon: AppIcon(
                                      icon: LineAwesomeIcons.user_check,
                                      backgroundColor: Colors.green,
                                      iconColor: Colors.white,
                                      iconSize: Dimensions.height10 * 5 / 2,
                                      size: Dimensions.height10 * 5,
                                    ),
                                    bigText: BigText(
                                        text: userController.userModel.name),
                                  ),
                                  SizedBox(height: Dimensions.height20),

                                  SizedBox(height: Dimensions.height20),
                                  // email
                                  AccountWidget(
                                    appIcon: AppIcon(
                                      icon: Icons.email_outlined,
                                      backgroundColor: AppColors.iconColor1,
                                      iconColor: Colors.white,
                                      iconSize: Dimensions.height10 * 5 / 2,
                                      size: Dimensions.height10 * 5,
                                    ),
                                    bigText: BigText(
                                        text: userController.userModel.email),
                                  ),
                                  SizedBox(height: Dimensions.height20),
                                  // address
                                  AccountWidget(
                                    appIcon: AppIcon(
                                      icon: LineAwesomeIcons.address_card,
                                      backgroundColor: AppColors.iconColor2,
                                      iconColor: Colors.white,
                                      iconSize: Dimensions.height10 * 5 / 2,
                                      size: Dimensions.height10 * 5,
                                    ),
                                    bigText: BigText(text: "Address"),
                                  ),
                                  SizedBox(height: Dimensions.height20),
                                  GestureDetector(
                                    onTap: () {
                                      if (Get.find<AuthController>()
                                          .userLoggedIn()) {
                                        Get.find<AuthController>()
                                            .clearShareData();
                                        Get.find<CartController>().clear();
                                        Get.find<CartController>()
                                            .clearCartHistory();
                                        Get.offNamed(RouteHelper.getSignIn());
                                      }
                                    },
                                    child: AccountWidget(
                                      appIcon: AppIcon(
                                        icon:
                                            LineAwesomeIcons.alternate_sign_out,
                                        backgroundColor: Colors.redAccent,
                                        iconColor: Colors.white,
                                        iconSize: Dimensions.height10 * 5 / 2,
                                        size: Dimensions.height10 * 5,
                                      ),
                                      bigText: BigText(text: "Logout"),
                                    ),
                                  ),
                                  SizedBox(height: Dimensions.height20),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : const CustomLoader())
              : Container();
        }));
  }
}
