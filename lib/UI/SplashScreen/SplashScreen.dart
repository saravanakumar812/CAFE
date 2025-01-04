import 'package:cafe/Controllers/SplashScreenController/SplashScreenController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import '../LoginScreen/LoginScreen.dart';

class SplashScreen extends GetView<SplashScreenController> {
  const SplashScreen({super.key});


  @override
  Widget build(BuildContext context) {
    SplashScreenController controller = Get.put(SplashScreenController());
    Future.delayed(Duration(seconds: 5), () {
      Get.off(() => LoginScreen(), transition: Transition.rightToLeft);
    });
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "assets/images/logo.png",
              ),
              fit: BoxFit.cover)),
    );
  }
}
