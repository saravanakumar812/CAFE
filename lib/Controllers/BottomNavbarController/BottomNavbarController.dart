

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';



class BottomNavController extends GetxController {
  var currentIndex = 0.obs;


  void changeIndex(int index) {
    currentIndex.value = index;

  }
}