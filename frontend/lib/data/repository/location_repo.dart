import 'package:frontend/data/api/api_client.dart';
import 'package:frontend/utils/app_constants.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class LoactionRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  LoactionRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response> getAddressfromGeoCode(LatLng latlng) async {
    return await apiClient.getData('${AppConstants.GEOCODE_URI}'
        '?lat=${latlng.latitude}&lng=${latlng.longitude}');
  }

  String getUserAddress() {
    return sharedPreferences.getString(AppConstants.USER_ADDRESS) ?? "";
  }
}
