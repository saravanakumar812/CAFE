
import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';

import '../../Components/Key.dart';
import '../../Modal/HomeScreenResponseModal.dart';
import '../../Utils/AppPreference.dart';

class HomeScreenController extends GetxController{
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController searchController = TextEditingController();
  RxList<HomeScreenResponseModel> homeScreenData = RxList();
  RxString address = RxString("India");

  var pass = true.obs;
  RxString localeAddress = RxString("");
  RxInt selectedTabIndex = 0.obs;
  @override

  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print("Latitude in Current Location : ${AppPreference().getLatitude}");
    print("Longitude in Current Location : ${AppPreference().getLongitude}");
    setMarker(AppPreference().getLatitude, AppPreference().getLongitude);
    homeScreenView();
  }

  homeScreenView() {
    HomeScreenResponseModel card1 = HomeScreenResponseModel();
    HomeScreenResponseModel card2 = HomeScreenResponseModel();
    HomeScreenResponseModel card3 = HomeScreenResponseModel();
    HomeScreenResponseModel card4 = HomeScreenResponseModel();


    card1.title = "Cappuccino";
    card1.images = "assets/images/cappuccino.png";
    card1.amount = "2\$";
    homeScreenData.add(card1);

    card2.title = "Espresso";
    card2.images = "assets/images/Espresso.png";
    card2.amount = "3\$";
    homeScreenData.add(card2);

    card3.title = "Americano";
    card3.images = "assets/images/Americano.png";
    card3.amount = "2.55\$";
    homeScreenData.add(card3);

    card4.title = "Latte";
    card4.images = "assets/images/Latte.png";
    card4.amount = "4\$";
    homeScreenData.add(card4);


  }









  Future<void> setMarker(Latitude, longitude) async {
    // initialPosition.value = value;
    List<Placemark> result = await placemarkFromCoordinates(Latitude, longitude);

    if (result.isNotEmpty) {
      address.value =
      ' ${result[0].locality}-${result[0].postalCode} ';
      // ${result[0].administrativeArea} ,
      // userDataProvider.setLatitude(value.latitude.toString());
      // ${result[0].name},
      // userDataProvider.setLongitude(value.longitude.toString());
      // userDataProvider.SetSelectedLocation(address.value);
      localeAddress.value = ' ${result[0].locality} ';
      print("Address In Home Screen ${address.value}");
      print("Local Address In Home Screen ${localeAddress.value}");
    }

    // Fluttertoast.showToast(msg: '📍' + address.value);
  }

  List<KeyValues> listValues = [
    KeyValues(key: "0", value: "COFFEE ",),
    KeyValues(key: "1", value: "DESSERTS"),
    KeyValues(key: "2", value: "ALCOHOL"),
    KeyValues(key: "3", value: "ALCOHOL FREE"),
    KeyValues(key: "4", value: "BREAKFAST"),
  ];

  updateCurrentTabIndex(int index) {
    print("INDEX$index");
    selectedTabIndex.value = index;
    listValues[selectedTabIndex.value].key;
    update();
  }
}