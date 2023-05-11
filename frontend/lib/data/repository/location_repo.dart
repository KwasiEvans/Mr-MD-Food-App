import 'package:frontend/data/api/api_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoactionRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  LoactionRepo({required this.apiClient, required this.sharedPreferences});
}
