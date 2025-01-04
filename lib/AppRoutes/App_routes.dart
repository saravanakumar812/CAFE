enum AppRoutes {
  root,
  login,
  bottomNav,
  productView, orderScreen, orderStatus
}

extension AppRouteExtension on AppRoutes {
  static const appRoutes = {
    AppRoutes.root: "/",
    AppRoutes.login: "/Login",
    AppRoutes.bottomNav:"/BottomNavScreen",
    AppRoutes.productView:"/ProductViewScreen",
    AppRoutes.orderScreen:"/OrderScreen",
    AppRoutes.orderStatus:"/OrderStatusScreen",

  };

  String get toName => appRoutes[this]!;
}
