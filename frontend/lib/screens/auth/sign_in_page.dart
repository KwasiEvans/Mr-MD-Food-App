import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/screens/auth/sign_up_page.dart';
import 'package:frontend/utils/dimentions.dart';
import 'package:frontend/widgets/app_text_field.dart';
import 'package:frontend/widgets/big_text.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../utils/colors.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: Dimensions.screenHeight * 0.05),
            Container(
              height: Dimensions.screenHeight * 0.25,
              child: const Center(
                child: CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage("assets/images/logo.png"),
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
              textEditingController: emailController,
              hintText: "Email",
              icon: FontAwesomeIcons.mailBulk,
            ),
            SizedBox(height: Dimensions.height20),
            AppTextField(
              textEditingController: passwordController,
              hintText: "Password",
              icon: FontAwesomeIcons.userLock,
            ),
            SizedBox(height: Dimensions.height20),
            Row(
              children: [
                Expanded(child: Container()),
                RichText(
                  text: TextSpan(
                    text: "Sign into your account",
                    style: TextStyle(
                        color: Colors.grey[500], fontSize: Dimensions.font16),
                  ),
                ),
                SizedBox(
                  width: Dimensions.width10,
                )
              ],
            ),
            SizedBox(height: Dimensions.height10),
            Container(
              width: Dimensions.screenWidth / 2,
              height: Dimensions.screenHeight / 13,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius15),
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
      ),
    );
  }
}
