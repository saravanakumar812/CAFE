import 'package:cafe/Utils/theme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Controllers/BottomNavbarController/BottomNavbarController.dart';
import '../CartScreen/CartScreen.dart';
import '../FavoriteScreen/FavoriteScreen.dart';
import '../HomeScreen/HomeScreen.dart';
import '../SettingScreen/SettingsScreen.dart';

class BottomNavBarScreen extends StatelessWidget {
  final BottomNavController controller =
      Get.put(BottomNavController()); // Initialize controller

  final List<Widget> _widgetList = [
    const HomeScreen(),
    const FavoriteScreen(),
    const CartScreen(),
    const SettingsScreen(),
  ];

  static const IconData restaurant =
      IconData(0xe532, fontFamily: 'MaterialIcons');
  static const IconData location_on =
      IconData(0xe3ab, fontFamily: 'MaterialIcons');
  static const IconData directions_car =
      IconData(0xe1d7, fontFamily: 'MaterialIcons');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            unselectedIconTheme: IconThemeData(color: Colors.grey[400]),
            selectedIconTheme: IconThemeData(color: AppTheme.buttonColor),
            unselectedLabelStyle: GoogleFonts.poppins(
              color: Colors.black,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
            selectedLabelStyle: GoogleFonts.poppins(
              color: Colors.black,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
            fixedColor: AppTheme.buttonColor,
            type: BottomNavigationBarType.fixed,
            currentIndex: controller.currentIndex.value,
            // Reactive index
            onTap: controller.changeIndex,
            // Update index via controller
            items: [
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage("assets/icons/home.png"),
                  ),
                  label: 'Home'.tr),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage("assets/icons/favorite.png"),
                  ),
                  label: 'Favorites'.tr),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/icons/cart.png")),
                  label: 'Cart'.tr),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage("assets/icons/user.png"),
                  ),
                  label: 'Profile'),
            ],
          )),
      body: Obx(() =>
          _widgetList[controller.currentIndex.value]), // Reactive widget change
    );
  }
}
