import 'package:get/get.dart';

import '../../Controllers/CartController/OrderScreenController.dart';

class OrderScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderScreenController>(() => OrderScreenController());
  }
}
