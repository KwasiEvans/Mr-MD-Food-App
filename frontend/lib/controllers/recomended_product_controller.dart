import 'package:frontend/data/repository/recomended_product_repo.dart';
import 'package:frontend/models/products_model.dart';
import 'package:get/get.dart';

class RecomendedProductController extends GetxController {
  final RecomendedProductRepo recomendedProductRepo;
  RecomendedProductController({required this.recomendedProductRepo});
  List<dynamic> _recomendedProductList = [];
  List<dynamic> get recomendedProductList => _recomendedProductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getRecomendedProductList() async {
    Response response = await recomendedProductRepo.getRecomendedProductList();
    if (response.statusCode == 200) {
      _recomendedProductList = [];
      _recomendedProductList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;
      update();
    } else {
      // ignore: avoid_print
      print("404 Error, fix your burg on recomended");
    }
  }
}
