import 'package:flutter/material.dart';
import 'package:frontend/utils/colors.dart';
import 'package:frontend/utils/dimentions.dart';
import 'package:frontend/widgets/account_widget.dart';
import 'package:frontend/widgets/app_icon.dart';
import 'package:frontend/widgets/big_text.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        centerTitle: true,
        title: BigText(
          text: "Account Info",
          size: 24,
          color: Colors.white,
        ),
      ),
      body: Container(
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
                    // Name
                    AccountWidget(
                      appIcon: AppIcon(
                        icon: LineAwesomeIcons.user_check,
                        backgroundColor: Colors.green,
                        iconColor: Colors.white,
                        iconSize: Dimensions.height10 * 5 / 2,
                        size: Dimensions.height10 * 5,
                      ),
                      bigText: BigText(text: "Kwasi Evans"),
                    ),
                    SizedBox(height: Dimensions.height20),
                    // phone
                    AccountWidget(
                      appIcon: AppIcon(
                        icon: LineAwesomeIcons.phone,
                        backgroundColor: AppColors.iconColor2,
                        iconColor: Colors.white,
                        iconSize: Dimensions.height10 * 5 / 2,
                        size: Dimensions.height10 * 5,
                      ),
                      bigText: BigText(text: "0244743739"),
                    ),
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
                      bigText: BigText(text: "kwasiow2002@gmail.com"),
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
                      bigText: BigText(text: "Kwasi Evans"),
                    ),
                    SizedBox(height: Dimensions.height20),
                    AccountWidget(
                      appIcon: AppIcon(
                        icon: LineAwesomeIcons.facebook_messenger,
                        backgroundColor: Colors.redAccent,
                        iconColor: Colors.white,
                        iconSize: Dimensions.height10 * 5 / 2,
                        size: Dimensions.height10 * 5,
                      ),
                      bigText: BigText(text: "Message"),
                    ),
                    SizedBox(height: Dimensions.height20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
