import 'package:frontend/screens/address/add_address_page.dart';
import 'package:frontend/screens/auth/sign_in_page.dart';
import 'package:frontend/screens/cart/cart_page.dart';
import 'package:frontend/screens/food/populer_food_detials.dart';
import 'package:frontend/screens/food/recomended_food_details.dart';
import 'package:frontend/screens/home/home_page.dart';
import 'package:frontend/screens/splash/splash_page.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String splashPage = "/splash-page";
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recomendedFood = "/recomended-food";
  static const String cartPage = "/cart-page";
  static const String signIn = "/sign-in";
  static const String addAddress = "/add-address";

  static String getSplashPage() => '$splashPage';
  static String getInitial() => initial;
  static String getPopularFood(int pageId, String page) =>
      '$popularFood?pageId=$pageId&page=$page';
  static String getRecomendedFood(int pageId, String page) =>
      '$recomendedFood?pageId=$pageId&page=$page';
  static String getCartPage() => '$cartPage';
  static String getSignIn() => '$signIn';
  static String getAddressPage() => '$addAddress';

  static List<GetPage> routes = [
    GetPage(name: splashPage, page: () => const SplashScreen()),
    // Getting home page
    GetPage(
      name: initial,
      page: () => const HomePage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: signIn,
      page: () => const SignInPage(),
      transition: Transition.fadeIn,
    ),
    // Getting popula food
    GetPage(
      name: popularFood,
      page: () {
        var pageId = Get.parameters['pageId'];
        var page = Get.parameters["page"];
        return PopularFoodDtails(pageId: int.parse(pageId!), page: page!);
      },
      transition: Transition.fade,
    ),
    GetPage(
      name: recomendedFood,
      page: () {
        var pageId = Get.parameters['pageId'];
        var page = Get.parameters["page"];
        return RecomendedFoodDetail(pageId: int.parse(pageId!), page: page!);
      },
      transition: Transition.cupertino,
    ),
    GetPage(
      name: cartPage,
      page: () {
        return const CartPage();
      },
      transition: Transition.native,
    ),
    GetPage(
      name: addAddress,
      page: () {
        return const AddAddressPage();
      },
      transition: Transition.native,
    ),
  ];
}
