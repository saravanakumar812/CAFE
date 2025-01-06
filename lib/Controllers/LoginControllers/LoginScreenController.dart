import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class LoginScreenController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxString currentLongitudeController = RxString("");
  RxString currentLatitudeController = RxString("");
  RxString address = RxString("India");
  RxString localeAddress = RxString("");
  var pass = true.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    determinePosition();
  }

  Future<void> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are disabled, show a toast message
      Fluttertoast.showToast(
          msg: 'Location services are disabled. Please enable them.');
      return; // You may want to handle this case differently based on your app's logic
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      var status = await Permission.location.request();
      if (status == PermissionStatus.denied) {
        Fluttertoast.showToast(msg: 'Location permissions are denied');
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      Fluttertoast.showToast(
          msg:
              'Location permissions are permanently denied, we cannot request permissions.');
      return;
    }
    var positions = await Geolocator.getCurrentPosition();
    var accuracy = await Geolocator.getLocationAccuracy();
    print('Accuracy: $accuracy');
    print('Latitude: ${positions.latitude}');
    print('Longitude: ${positions.longitude}');
    currentLongitudeController.value = positions.longitude.toString();
    currentLatitudeController.value = positions.latitude.toString();
    setMarker((positions.latitude), positions.longitude);
  }

  Future<void> setMarker(Latitude, longitude) async {
    // initialPosition.value = value;
    List<Placemark> result =
        await placemarkFromCoordinates(Latitude, longitude);

    if (result.isNotEmpty) {
      address.value =
          '${result[0].name}, ${result[0].locality} ${result[0].administrativeArea} , ${result[0].postalCode}';
      localeAddress.value = ' ${result[0].locality} ';
      // userDataProvider.setLatitude(value.latitude.toString());
      // userDataProvider.setLongitude(value.longitude.toString());
      // userDataProvider.SetSelectedLocation(address.value);
      print("Address ${address.value}");
    }

    // Fluttertoast.showToast(msg: '📍' + address.value);
  }
}
