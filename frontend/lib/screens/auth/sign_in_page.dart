import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/base/custorm_loader.dart';
import 'package:frontend/controllers/auth_controller.dart';
import 'package:frontend/routes/route_helper.dart';
import 'package:frontend/screens/auth/sign_up_page.dart';
import 'package:frontend/utils/dimentions.dart';
import 'package:frontend/widgets/app_text_field.dart';
import 'package:frontend/widgets/big_text.dart';
import 'package:get/get.dart';
import 'package:frontend/base/show_custom_snackbar.dart';

import '../../utils/colors.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    var phoneController = TextEditingController();
    var passwordController = TextEditingController();

    void _login(AuthController authController) {
      String phone = phoneController.text.trim();
      String password = passwordController.text.trim();

      // validation
      if (phone.isEmpty) {
        showCustomSnackBar("Enter your email", title: "Email Address");
      } else if (password.isEmpty) {
        showCustomSnackBar("Enter your password", title: "Password");
      } else if (password.length < 6) {
        showCustomSnackBar("Password can not be less than 6 charaters",
            title: "Password");
      } else {
        authController.login(phone, password).then((status) {
          if (status.isSuccess) {
            Get.toNamed(RouteHelper.getInitial());
          } else {
            showCustomSnackBar(status.message);
          }
        });
      }
    }

    return Scaffold(
        backgroundColor: Colors.white,
        body: GetBuilder<AuthController>(builder: (authController) {
          return !authController.isLoading
              ? SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(height: Dimensions.screenHeight * 0.05),
                      Container(
                        height: Dimensions.screenHeight * 0.25,
                        child: const Center(
                          child: CircleAvatar(
                            radius: 80,
                            backgroundImage:
                                AssetImage("assets/images/logo.png"),
                            backgroundColor: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: Dimensions.height20),
                      Container(
                        margin: EdgeInsets.only(left: Dimensions.width20),
                        width: double.maxFinite,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Welcome back",
                                style: TextStyle(
                                  fontSize: Dimensions.font20 * 2,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.mainColor,
                                ),
                              ),
                              Text(
                                "Sign in to continue",
                                style: TextStyle(
                                  fontSize: Dimensions.font20,
                                  color: AppColors.paraColor,
                                ),
                              ),
                            ]),
                      ),
                      SizedBox(height: Dimensions.height20),
                      AppTextField(
                        textEditingController: phoneController,
                        hintText: "What is your phone number?",
                        icon: FontAwesomeIcons.phoneAlt,
                      ),
                      SizedBox(height: Dimensions.height20),
                      AppTextField(
                        textEditingController: passwordController,
                        hintText: "Password",
                        icon: FontAwesomeIcons.userLock,
                        isObscure: true,
                      ),
                      SizedBox(height: Dimensions.height20),
                      Row(
                        children: [
                          Expanded(child: Container()),
                          // RichText(
                          //   text: TextSpan(
                          //     text: "Sign into your account",
                          //     style: TextStyle(
                          //         color: Colors.grey[500],
                          //         fontSize: Dimensions.font16),
                          //   ),
                          // ),
                          SizedBox(
                            width: Dimensions.width10,
                          )
                        ],
                      ),
                      SizedBox(height: Dimensions.height10),
                      GestureDetector(
                        onTap: () {
                          _login(authController);
                        },
                        child: Container(
                          width: Dimensions.screenWidth / 2,
                          height: Dimensions.screenHeight / 13,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius15),
                            color: AppColors.mainColor,
                          ),
                          child: Center(
                            child: BigText(
                              text: "Sign in",
                              size: Dimensions.font20 + Dimensions.font20 / 2,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: Dimensions.screenHeight * 0.05),
                      RichText(
                        text: TextSpan(
                          // ignore: unnecessary_string_escapes
                          text: "Don\'t have account?",
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: Dimensions.font16,
                          ),
                          children: [
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Get.to(const SignUpPage(),
                                    transition: Transition.fadeIn),
                              text: " Creat Account.",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: Dimensions.font16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              : const CustomLoader();
        }));
  }
}
