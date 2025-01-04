
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../Components/Key.dart';



class ProductDetailsViewScreenController extends GetxController {
  RxInt selectedTabIndex = 0.obs;
  RxInt count = RxInt(1);
  RxBool isLoading = RxBool(false);
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
  void increment() {
    count++;
  }
  void decrement() {
    count--;
  }
  List<KeyValues> listValues = [
    KeyValues(key: "0", value: "Small "),
    KeyValues(key: "1", value: "Medium"),
    KeyValues(key: "2", value: "Large"),

  ];

  updateCurrentTabIndex(int index) {
    print("INDEX$index");
    selectedTabIndex.value = index;
    listValues[selectedTabIndex.value].key;
    update();
  }
}