
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../Components/image_pickers.dart';

class SettingsScreenController extends GetxController{
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();

  TextEditingController timeOfBirthController = TextEditingController();
  TextEditingController marriageController = TextEditingController();
  RxBool vegSwitchValue = RxBool(false);
  Rx<PickedImage?> itemImage = Rx<PickedImage?>(null);
  RxList<PickedImage> productImages = RxList();
  RxBool isImageSelected = false.obs;
  RxString imageString = RxString("");
  var pass = true.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}