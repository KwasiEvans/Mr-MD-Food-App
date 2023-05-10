import 'package:frontend/data/api/api_client.dart';
import 'package:frontend/models/signup_model.dart';
import 'package:frontend/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class AuthRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  AuthRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response> registration(SignUpModel signUpModel) async {
    return await apiClient.postData(
        AppConstants.REGISTRATION_URL, signUpModel.toJson());
  }

  Future<Response> login(String email, String password) async {
    return await apiClient.postData(
      AppConstants.LOGIN_URL,
      {"email": email, "password": password},
    );
  }

  Future<bool> saveUserToken(String token) async {
    apiClient.token = token;
    apiClient.updateHeader(token);
    return await sharedPreferences.setString(AppConstants.TOKEN, token);
  }

  Future<void> saveUserNumberAndPassword(String number, String password) async {
    try {
      await sharedPreferences.setString(AppConstants.PHONE, number);
      await sharedPreferences.setString(AppConstants.PASSWORD, password);
    } catch (e) {
      // ignore: use_rethrow_when_possible
      throw e;
    }
  }
}
