import 'package:frontend/utils/app_constants.dart';
import 'package:get/get.dart';

import '../api/api_client.dart';

class RecomendedProductRepo extends GetxService {
  final ApiClient apiClient;
  RecomendedProductRepo({required this.apiClient});

  Future<Response> getRecomendedProductList() async {
    // return await apiClient.getData("/api/v1/products/popular");
    return await apiClient.getData(AppConstants.RECOMMENDED_PRODUCT_URI);
  }
}
