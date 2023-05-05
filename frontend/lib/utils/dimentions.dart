import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  static double pageView = screenHeight / 2.64;
  static double pageViewContainer = screenHeight / 3.84;
  static double pageViewTextContainer = screenHeight / 7.03;
// dynamic height for padding and margin
  static double height10 = screenHeight / 84.4;
  static double height15 = screenHeight / 52.7;
  static double height20 = screenHeight / 42.2;
  static double height30 = screenHeight / 28.13;
  static double height45 = screenHeight / 18.76;

  // dynamic width for padding and margin
  static double width10 = screenHeight / 84.4;
  static double width15 = screenHeight / 52.7;
  static double width20 = screenHeight / 42.2;
  static double width30 = screenHeight / 28.13;

// Font size
  static double font16 = screenHeight / 52.75;
  static double font20 = screenHeight / 42.2;
  static double font26 = screenHeight / 32.46;

  // Radius
  static double radius15 = screenHeight / 56.27;
  static double radius20 = screenHeight / 42.2;
  static double radius30 = screenHeight / 28.13;

  // Dinamic Icon size
  static double iconSize24 = screenHeight / 35.17;
  static double iconSize16 = screenHeight / 52.75;

  // List view size
  static double listViewImgSize = screenWidth / 3.25;
  static double listViewTextContainer = screenWidth / 3.9;

  // popular food
  static double popularFoodImage = screenHeight / 2.41;

  // Bottom hieght
  static double bottonHeightBar = screenHeight / 7.03;

  // splash screens dimentions
  static double splashImg = screenHeight / 3.38;
}
