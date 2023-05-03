import 'package:frontend/controllers/popular_product_controller.dart';
import 'package:frontend/data/api/api_client.dart';
import 'package:frontend/data/repository/popular_product_repo.dart';
import 'package:get/get.dart';

Future<void> init() async {
  // api client
  Get.lazyPut(() => ApiClient(appBaseUrl: "http://mvs.bslmeiyu.com"));

  // Repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));

  // Controller
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
}
