import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/base/show_custom_snackbar.dart';
import 'package:frontend/controllers/auth_controller.dart';
import 'package:frontend/models/signup_model.dart';
import 'package:frontend/utils/dimentions.dart';
import 'package:frontend/widgets/app_text_field.dart';
import 'package:frontend/widgets/big_text.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../utils/colors.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();

    // Account images
    var signUpImages = ["twitter.png", "apple.png", "google.png"];

    void _registration() {
      var authController = Get.find<AuthController>();
      String name = nameController.text.trim();
      String phone = phoneController.text.trim();
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      // validation
      if (name.isEmpty) {
        showCustomSnackBar("Enter your name", title: "Name");
      } else if (phone.isEmpty) {
        showCustomSnackBar("Enter your phone number", title: "Phone Number");
      } else if (email.isEmpty) {
        showCustomSnackBar("Enter your email", title: "Email Address");
      } else if (!GetUtils.isEmail(email)) {
        showCustomSnackBar("Enter your valid email address",
            title: "Valid Email Address");
      } else if (password.isEmpty) {
        showCustomSnackBar("Enter your password", title: "Password");
      } else if (password.length < 6) {
        showCustomSnackBar("Password can not be less than 6 charaters",
            title: "Password");
      } else {
        showCustomSnackBar("Sucessfull", title: "Perfect");
        SignUpModel signUpModel = SignUpModel(
          name: name,
          phone: phone,
          email: email,
          password: password,
        );
        authController.registration(signUpModel).then((status) {
          if (status.isSuccess) {
            print("Sucessfull registration");
          } else {
            showCustomSnackBar(status.message);
          }
        });
      }
    }

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
            AppTextField(
              textEditingController: nameController,
              hintText: "Name",
              icon: LineAwesomeIcons.user_check,
            ),
            SizedBox(height: Dimensions.height20),
            AppTextField(
              textEditingController: phoneController,
              hintText: "Phone Number",
              icon: LineAwesomeIcons.mobile_phone,
            ),
            SizedBox(height: Dimensions.height20),
            GestureDetector(
              onTap: () {
                _registration();
              },
              child: Container(
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
            ),
            SizedBox(height: Dimensions.height10),
            RichText(
              text: TextSpan(
                recognizer: TapGestureRecognizer()..onTap = () => Get.back(),
                text: "Have an account already?",
                style: TextStyle(
                    color: Colors.grey[500], fontSize: Dimensions.font20),
              ),
            ),
            SizedBox(height: Dimensions.screenHeight * 0.05),
            RichText(
              text: TextSpan(
                text: "Or, Sign up with following account",
                style: TextStyle(
                    color: Colors.grey[500], fontSize: Dimensions.font16),
              ),
            ),
            Wrap(
              children: List.generate(
                3,
                (index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: Dimensions.radius30,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage(
                      // ignore: prefer_interpolation_to_compose_strings
                      "assets/images/" + signUpImages[index],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
