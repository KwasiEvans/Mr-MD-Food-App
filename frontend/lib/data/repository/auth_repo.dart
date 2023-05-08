import 'package:frontend/data/api/api_client.dart';
import 'package:frontend/models/signup_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  AuthRepo({
    required this.apiClient,
    required this.sharedPreferences,
  });

  // ignore: prefer_final_fields
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  registration(SignUpModel signUpModel){
     _isLoading = true;
     
  }
}
