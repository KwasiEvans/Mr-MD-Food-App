import 'package:frontend/data/api/api_client.dart';
import 'package:frontend/models/address_model.dart';
import 'package:frontend/utils/app_constants.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class LocationRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  LocationRepo({required this.apiClient, required this.sharedPreferences});
  
  Future<Response>getAddressfromGeocode(LatLng latlng) async{
    return await apiClient.getData('${AppConstants.GEOCODE_URI}'
    '?lat=${latlng.latitude}&lng=${latlng.longitude}'
    );
  }

   String getUserAddress(){
    return sharedPreferences.getString(AppConstants.USER_ADDRESS)??"";
  }

  Future<Response> addAddress(AddressModel addressModel)async{
    return await apiClient.postData(AppConstants.ADD_USER_ADDRESS, addressModel.toJson());
  }
}
