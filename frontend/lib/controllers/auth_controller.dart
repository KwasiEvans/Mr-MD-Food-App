import 'package:frontend/data/repository/auth_repo.dart';
import 'package:frontend/models/response_model.dart';
import 'package:frontend/models/signup_model.dart';
import 'package:get/get.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepo authRepo;
  AuthController({
    required this.authRepo,
  });

  // ignore: prefer_final_fields
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<ResponseModel> registration(SignUpModel signUpModel) async {
    _isLoading = true;
    Response response = await authRepo.registration(signUpModel);
    late ResponseModel responseModel;
    if (response.statusCode == 200) {
      authRepo.saveUserToken(response.body["token"]);
      responseModel = ResponseModel(true, response.body["token"]);
    } else {
      responseModel = ResponseModel(true, response.statusText!);
    }
    _isLoading = false;
    update();
    return responseModel;
  }
}
