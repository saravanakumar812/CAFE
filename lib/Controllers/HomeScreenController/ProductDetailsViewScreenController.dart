
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../Components/Key.dart';



class ProductDetailsViewScreenController extends GetxController {
  RxInt selectedTabIndex = 0.obs;
  RxInt countOne = RxInt(1);
  RxInt countTwo = RxInt(1);
  RxInt countThree = RxInt(1);
  RxInt countFour = RxInt(1);
  RxBool isLoading = RxBool(false);



  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
  void incrementOne() {
    countOne++;
  }
  void incrementTwo() {
    countTwo++;
  }
  void incrementThree() {
    countThree++;
  }

  void incrementFour() {
    countFour++;
  }

  void decrementOne() {
    if(countOne == 0){
      return;
    }
    countOne--;
  }
  void decrementTwo() {
    if(countTwo == 0){
      return;
    }
    countTwo--;
  }
  void decrementThree() {
    if(countThree == 0){
      return;
    }
    countThree--;
  }

  void decrementFour() {
    if(countFour == 0){
      return;
    }
    countFour--;
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