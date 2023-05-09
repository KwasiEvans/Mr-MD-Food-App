import 'package:frontend/data/api/api_client.dart';
import 'package:frontend/models/signup_model.dart';
import 'package:frontend/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  AuthRepo({
    required this.apiClient,
    required this.sharedPreferences,
  });

  Future<Response> registration(SignUpModel signUpModel) async {
    return await apiClient.postData(
        AppConstants.REGISTRATION_URL, signUpModel.toJson());
  }

  saveUserToken(String token) async {
    apiClient.token = token;
    apiClient.updateHeader(token);
    return await sharedPreferences.setString(AppConstants.TOKEN, token);
  }
}
