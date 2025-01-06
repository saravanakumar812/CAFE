import 'package:cafe/Controllers/HomeScreenController/ProductDetailsViewScreenController.dart';
import 'package:get/get.dart';

class ProductDetailsViewScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductDetailsViewScreenController>(
        () => ProductDetailsViewScreenController());
  }
}
