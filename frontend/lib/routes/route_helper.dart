import 'package:frontend/screens/food/populer_food_detials.dart';
import 'package:frontend/screens/food/recomended_food_details.dart';
import 'package:frontend/screens/home/main_page.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recomendedFood = "/recomended-food";

  static String getInitial() => initial;
  static String getPopularFood() => popularFood;
  static String getRecomendedFood() => recomendedFood;

  static List<GetPage> routes = [
    GetPage(
        name: initial,
        page: () => const MainPage(),
        transition: Transition.fadeIn),
    GetPage(
      name: popularFood,
      page: () {
        return const PopularFoodDtails();
      },
      transition: Transition.fade,
    ),
    GetPage(
      name: recomendedFood,
      page: () {
        return const RecomendedFoodDetail();
      },
      transition: Transition.fade,
    ),
  ];
}
