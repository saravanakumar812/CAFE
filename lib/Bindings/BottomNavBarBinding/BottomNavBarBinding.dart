

import 'package:get/get.dart';


import '../../Controllers/BottomNavbarController/BottomNavbarController.dart';


class BottomNavBarScreenBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<BottomNavController>(
            () => BottomNavController());
  }

}