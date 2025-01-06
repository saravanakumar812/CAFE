import 'package:get/get.dart';

import '../../Controllers/CartController/OrderStatusScreenController.dart';

class OrderStatusScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderStatusScreenController>(
        () => OrderStatusScreenController());
  }
}
