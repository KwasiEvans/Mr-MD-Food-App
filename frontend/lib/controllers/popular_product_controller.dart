import 'package:frontend/data/repository/popular_product_repo.dart';
import 'package:frontend/models/products_model.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});
  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      // ignore: avoid_print
      print("got products");
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      // ignore: avoid_print
      print(_popularProductList);
      update();
    } else {
      print("404 Error, fix your burg");
    }
  }
}
