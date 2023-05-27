import 'package:flutter/material.dart';
import 'package:frontend/controllers/auth_controller.dart';
import 'package:frontend/controllers/location_controller.dart';
import 'package:frontend/controllers/user_controller.dart';
import 'package:frontend/models/address_model.dart';
import 'package:frontend/utils/colors.dart';
import 'package:frontend/utils/dimentions.dart';
import 'package:frontend/widgets/app_text_field.dart';
import 'package:frontend/widgets/big_text.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddAddressPage extends StatefulWidget {
  const AddAddressPage({super.key});

  @override
  State<AddAddressPage> createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  TextEditingController _addressController = TextEditingController();
  final TextEditingController _controllerPersonName = TextEditingController();
  final TextEditingController _controllerPersonNumber = TextEditingController();
  late bool _isLogged;
  CameraPosition _cameraPosition = CameraPosition(
    target: LatLng(5.5560, -0.1969),
    zoom: 17,
  );
  late LatLng _initialPosition = LatLng(5.5560, -0.1969);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isLogged = Get.find<AuthController>().userLoggedIn();
    // ignore: unnecessary_null_comparison
    // if (_isLogged && Get.find<UserController>().userModel == null) {
      Get.find<UserController>().getUserInfo();
    // }
    if (Get.find<LocationController>().addressList.isNotEmpty) {
      _cameraPosition = CameraPosition(
          target: LatLng(
              double.parse(
                  Get.find<LocationController>().getAddress["latitude"]),
              double.parse(
                  Get.find<LocationController>().getAddress["longitude"])));
       _initialPosition =  LatLng(
           double.parse(
               Get.find<LocationController>().getAddress["latitude"]),
           double.parse(
               Get.find<LocationController>().getAddress["longitude"]));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add your delivery address"),
        backgroundColor: AppColors.mainColor,
        automaticallyImplyLeading: false,
      ),
      body: GetBuilder<UserController>(builder: (userController){
        if(_controllerPersonName.text.isEmpty){
          _controllerPersonName.text = userController.userModel.name;
          _controllerPersonNumber.text = userController.userModel.phone;
          if(Get.find<LocationController>().addressList.isNotEmpty){
            _addressController.text = Get.find<LocationController>().getUserAddress().address;
          }
        }
        return GetBuilder<LocationController>(builder: (locationController){
          _addressController.text = '${locationController.placemark.name??''}'
              '${locationController.placemark.locality??''}'
              '${locationController.placemark.postalCode??''}'
              '${locationController.placemark.country??''}';
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 140,
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.only(left: 5, right: 5,top: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                          width: 2,
                          color: AppColors.mainColor,
                      )
                  ),
                  child: Stack(
                    children: [
                      GoogleMap(initialCameraPosition: CameraPosition(target: _initialPosition, zoom:17),
                        zoomControlsEnabled: false,
                        compassEnabled: false,
                        indoorViewEnabled: true,
                        mapToolbarEnabled: false,
                        onCameraIdle: (){
                          locationController.updatePosition(_cameraPosition, true);
                        },
                        onCameraMove: ((position)=>_cameraPosition=position),
                        onMapCreated: (GoogleMapController controller){
                          locationController.setMapController(controller);
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: Dimensions.width20, top: Dimensions.height20),
                  child: SizedBox(height: 50, child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: locationController.addressTypeList.length,
                    itemBuilder: (context, index){
                    return InkWell(
                      onTap: (){
                        locationController.setAddressTypeIndex(index);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: Dimensions.width20,
                        vertical: Dimensions.height10),
                        margin: EdgeInsets.only(right: Dimensions.width10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimensions.radius20/4),
                          color: Theme.of(context).cardColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey[200]!,
                              spreadRadius: 1,
                              blurRadius: 5,
                            )
                          ]
                        ),
                        child: Row(
                          children: [
                            Icon(
                              index==0?Icons.home_max:index==1?Icons.work:Icons.location_on_outlined,
                              color: locationController.addressTypeIndex==index?AppColors.mainColor:Theme.of(context).disabledColor,
                            )
                          ],
                        ),
                      ),
                    );
                  },),),
                ),
                SizedBox(height: Dimensions.height20),
                Padding(
                  padding:  EdgeInsets.only(left: Dimensions.width10),
                  child: BigText(text: "Delivery Address", color: AppColors.mainColor,),
                ),
                SizedBox(height: Dimensions.height20),
                AppTextField(textEditingController: _addressController, hintText: "Delivery address", icon: Icons.maps_ugc,),
                SizedBox(height: Dimensions.height20),
                Padding(
                  padding:  EdgeInsets.only(left: Dimensions.width10),
                  child: BigText(text: "Receiver's Name",color: AppColors.mainColor),
                ),
                SizedBox(height: Dimensions.height20),
                AppTextField(textEditingController: _controllerPersonName, hintText: "What is the receiver name?", icon: Icons.person_2_outlined,),
                SizedBox(height: Dimensions.height20),
                Padding(
                  padding:  EdgeInsets.only(left: Dimensions.width10),
                  child: BigText(text: "Receiver's phone number",color: AppColors.mainColor),
                ),
                SizedBox(height: Dimensions.height20),
                AppTextField(textEditingController: _controllerPersonNumber, hintText: "What is the receiver phone number?", icon: Icons.phone_android_outlined,),
              ],
            ),
          );
        });
      }),
      bottomNavigationBar: GetBuilder<LocationController>(
        builder: (locationController) {
       return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: Dimensions.height20*8,
            padding: EdgeInsets.only(
                top: Dimensions.height30,
                bottom: Dimensions.height30,
                left: Dimensions.width20,
                right: Dimensions.width20),
            decoration: BoxDecoration(
              color: AppColors.buttonBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimensions.radius20 * 2),
                topRight: Radius.circular(Dimensions.radius20 * 2),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: ()  {
                    AddressModel _addressModel = AddressModel(addressType: locationController.addressTypeList
                    [locationController.addressTypeIndex],
                    contactPersonName: _controllerPersonName.text,
                    contactPersonNumber: _controllerPersonNumber.text,
                    address: _addressController.text,
                    latitude: locationController.position.latitude.toString(),
                    longitude: locationController.position.longitude.toString(),
                    );
                    locationController.addAddress(_addressModel).then((response){
                      if(response.isSuccess){
                        Get.back();
                        Get.snackbar("Delivery address", "Address added successfully");
                      }else{
                        Get.snackbar("Delivery address", "Could not save delivery address");
                      }
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.only(
                        top: Dimensions.height20,
                        bottom: Dimensions.height20,
                        left: Dimensions.width20,
                        right: Dimensions.width20),
                    // ignore: sort_child_properties_last
                    child: BigText(
                      text: "Continue",
                      color: Colors.white,
                    ),
                    decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.circular(Dimensions.radius20-10),
                      color: AppColors.mainColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    },
    ),
    );
  }
}
