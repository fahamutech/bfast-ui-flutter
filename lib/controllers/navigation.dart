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

  static final Map<String, List<BFastUIRouter>> _routes = {};

  NavigationController addRoute(BFastUIRouter route) {
    if (_routes.containsKey(_moduleName)) {
      _routes[_moduleName].add(route);
    } else {
      _routes[_moduleName] = [route];
    }
    _routes[_moduleName].toSet().toList();
    return this;
  }

  NavigationController addRoutes(List<BFastUIRouter> routes) {
    _routes[_moduleName] = routes;
    _routes[_moduleName].toSet().toList();
    return this;
  }

  List<BFastUIRouter> getRoutes() {
    return _routes[_moduleName];
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
