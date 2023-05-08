import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
            Container(
              margin: EdgeInsets.only(left: Dimensions.width20),
              child: Column(children: [
                Text(
                  "Welcome back",
                  style: TextStyle(
                    fontSize: Dimensions.font20 * 2,
                    fontWeight: FontWeight.bold,
                    color: AppColors.mainColor,
                  ),
                )
              ]),
            ),
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
            Container(
              width: Dimensions.screenWidth / 2,
              height: Dimensions.screenHeight / 13,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius15),
                color: AppColors.mainColor,
              ),
              child: Center(
                child: BigText(
                  text: "Sign up",
                  size: Dimensions.font20 + Dimensions.font20 / 2,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: Dimensions.height10),
            RichText(
              text: TextSpan(
                text: "Sign into your account",
                style: TextStyle(
                    color: Colors.grey[500], fontSize: Dimensions.font16),
              ),
            ),
            SizedBox(height: Dimensions.screenHeight * 0.05),
            RichText(
              text: TextSpan(
                text: "Or, Sign up with following account",
                style: TextStyle(
                    color: Colors.grey[500], fontSize: Dimensions.font16 - 5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
