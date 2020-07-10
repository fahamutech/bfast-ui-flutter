import 'package:bfastui/adapters/router.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../config.dart';

class NavigationController {
  static final NavigationController _instance = NavigationController._();

  factory NavigationController.getInstance() {
    return _instance;
  }

  NavigationController._();

  Map<String, List<RouterAdapter>> _routes = {};

  NavigationController addRoute(RouterAdapter route,
      [String moduleName = BFastUIConfig.DEFAULT_MODULE]) {
    if (this._routes.containsKey(moduleName)) {
      this._routes[moduleName].add(route);
    } else {
      this._routes[moduleName] = [route];
    }
    return this;
  }

  NavigationController addRoutes(List<RouterAdapter> routes,
      [String moduleName = BFastUIConfig.DEFAULT_MODULE]) {
    this._routes[moduleName] = routes;
    return this;
  }

  List<RouterAdapter> getServices(
      [String moduleName = BFastUIConfig.DEFAULT_MODULE]) {
    return this._routes[moduleName];
  }

  to(String route) {
    Modular.to.pushNamed(route);
  }

  toAndReplace(String route) {
    Modular.to.pushReplacementNamed(route);
  }
}
