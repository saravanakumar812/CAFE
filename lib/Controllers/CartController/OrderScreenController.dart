import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../../AppRoutes/App_routes.dart';
import '../../Modal/OrderResponseModal.dart';

class OrderScreenController extends GetxController{
  RxList<OrderResponseModel> orderData = RxList();
  RxInt count = RxInt(1);
  Razorpay razorpay = Razorpay();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
    orderList();
  }
  @override
  void dispose() {
    super.dispose();
    razorpay.clear();
  }
  orderList() {
    OrderResponseModel card1 = OrderResponseModel();
    OrderResponseModel card2 = OrderResponseModel();


    card1.title = "Cappuccino";
    card1.images = "assets/images/cappuccino.png";
    card1.amount = "2\$";
    card1.ratings = "3.5";
    orderData.add(card1);

    card2.title = "Espresso";
    card2.images = "assets/images/Espresso.png";
    card2.amount = "3\$";
    card2.ratings = "4.5";
    orderData.add(card2);




  }
  void increment() {
    count++;
  }
  void decrement() {
    count--;
  }
  void openCheckOut() {
    var options = {
      'key': 'rzp_test_y7jlqVGKmyovVX',
      'amount': 2500, //in the smallest currency sub-unit.
      'name': 'Mpfoods',
      'order_id': "", // Generate order_id using Orders API
      'description': '',
      'timeout': 300, // in seconds
      'prefill': {
        'contact': "6383785608",
        'email': ''
      },
      'external': {
        'wallets': ['paytm']
      },
      'experiments.upi_turbo': true,
    };

    try {
      razorpay.open(options);

      // log(payment);
      // print(payment);
      // debugPrint(payment);
    } catch (e) {
      debugPrint("error : e");
    }
  }
  void handlePaymentSuccess(PaymentSuccessResponse response) {
    print("Payment Success");
    // paymentProcess(response.orderId.toString(), response.paymentId.toString(),
    //     response.signature.toString(), 1);
    // Get.offNamed(AppRoutes.bookingSuccessfullyScreen);
  }

  void handlePaymentError(PaymentFailureResponse response) {
    print("Payment Failed");
    // paymentProcess("", "", "", 0);
    Get.offNamed(AppRoutes.login.toName);
  }

  void handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
  }
}