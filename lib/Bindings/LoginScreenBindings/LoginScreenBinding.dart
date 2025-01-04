import 'package:get/get.dart';

import '../../Controllers/LoginControllers/LoginScreenController.dart';

class LoginScreenBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<LoginScreenController>(
            () => LoginScreenController());
  }

}