import 'package:frontend/screens/food/populer_food_detials.dart';
import 'package:frontend/screens/food/recomended_food_details.dart';
import 'package:frontend/screens/home/main_page.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recomendedFood = "/recomended-food";

  static String getInitial() => initial;
  static String getPopularFood(int pageId) => '$popularFood?pageId=$pageId';
  static String getRecomendedFood() => recomendedFood;

  static List<GetPage> routes = [
    // Getting home page
    GetPage(
        name: initial,
        page: () => const MainPage(),
        transition: Transition.fadeIn),
    // Getting popula food
    GetPage(
      name: popularFood,
      page: () {
        var pageId = Get.parameters['pageId'];
        return PopularFoodDtails(pageId: int.parse(pageId!));
      },
      transition: Transition.fade,
    ),
    GetPage(
      name: recomendedFood,
      page: () {
        return const RecomendedFoodDetail();
      },
      transition: Transition.cupertino,
    ),
  ];
}
