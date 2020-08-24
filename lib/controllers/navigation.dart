import 'package:bfastui/adapters/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../config.dart';

class NavigationController {
  static final NavigationController _instance = NavigationController._();
  static String _moduleName = BFastUIConfig.DEFAULT_MODULE;

  factory NavigationController.getInstance(
      [String moduleName = BFastUIConfig.DEFAULT_MODULE]) {
    _moduleName = moduleName;
    return _instance;
  }

  NavigationController._();

  static final Map<String, Map<String, BFastUIRouter>> _routes = {};

  NavigationController addRoute(BFastUIRouter route) {
    if (_routes.containsKey(_moduleName)) {
      _routes[_moduleName]
          .update(route.routerName, (_) => route, ifAbsent: () => route);
    } else {
      Map<String, BFastUIRouter> map = Map();
      map.update(route.routerName, (_) => route, ifAbsent: () => route);
      _routes[_moduleName] = map;
    }
    return this;
  }

  List<BFastUIRouter> getRoutes() {
    return _routes[_moduleName] != null
        ? _routes[_moduleName].values.toList()
        : [];
  }

  to(String routeName) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Modular.to.pushNamed(routeName);
    });
  }

  toAndReplace(String routeName) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Modular.to.pushReplacementNamed(routeName);
    });
  }
}
