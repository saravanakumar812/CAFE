import 'package:cafe/Bindings/CartScreenBindings/OrderScreenBiding.dart';
import 'package:cafe/Bindings/HomeScreenBindings/ProductDetailsViewScreenBinding.dart';
import 'package:cafe/UI/CartScreen/OrderScreen.dart';
import 'package:cafe/UI/CartScreen/OrderStatusScreen.dart';
import 'package:cafe/UI/HomeScreen/ProductDetailsViewScreen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../Bindings/BottomNavBarBinding/BottomNavBarBinding.dart';
import '../Bindings/CartScreenBindings/OrderStatusScreenBinding.dart';
import '../Bindings/LoginScreenBindings/LoginScreenBinding.dart';
import '../UI/BottomNavBarScreen/BottomNavBar.dart';
import '../UI/LoginScreen/LoginScreen.dart';
import 'App_routes.dart';

class AppPages {
  static var list = [
    GetPage(
        name: AppRoutes.login.toName,
        page: () => const LoginScreen(),
        binding: LoginScreenBinding()),
    GetPage(
        name: AppRoutes.bottomNav.toName,
        page: () => BottomNavBarScreen(),
        binding: BottomNavBarScreenBinding()),
    GetPage(
        name: AppRoutes.productView.toName,
        page: () => ProductDetailsViewScreen(),
        binding: ProductDetailsViewScreenBinding()),
    GetPage(
        name: AppRoutes.orderScreen.toName,
        page: () => OrderScreen(),
        binding: OrderScreenBinding()),
    GetPage(
        name: AppRoutes.orderStatus.toName,
        page: () => OrderStatusScreen(),
        binding: OrderStatusScreenBinding()),

  ];
}
