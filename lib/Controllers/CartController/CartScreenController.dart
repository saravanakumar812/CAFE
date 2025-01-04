
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../Modal/CartResponseModal.dart';

class CartScreenController extends GetxController{
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxList<CartResponseModel> cartData = RxList();
  RxList<RxInt> counter = RxList<RxInt>([RxInt(1)]);
  RxInt count = RxInt(1);
  var pass = true.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    cartList();
  }

  cartList() {
    CartResponseModel card1 = CartResponseModel();
    CartResponseModel card2 = CartResponseModel();



    card1.title = "Cappuccino";
    card1.images = "assets/images/cappuccino.png";
    card1.amount = "2\$";
    card1.ratings = "3.5";
    cartData.add(card1);

    card2.title = "Espresso";
    card2.images = "assets/images/Espresso.png";
    card2.amount = "3\$";
    card2.ratings = "4.5";
    cartData.add(card2);




  }

  void increment() {
    count++;
  }
  void decrement() {
    count--;
  }
}