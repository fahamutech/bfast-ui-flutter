import 'package:bfastui/adapters/router.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../config.dart';

class NavigationController {
  static final NavigationController _instance = NavigationController._();

  factory NavigationController.getInstance() {
    return _instance;
  }

  NavigationController._();

  Map<String, List<RouterAdapter>> routes = {};

  NavigationController addRoute(RouterAdapter route,
      [String moduleName = BFastUIConfig.DEFAULT_MODULE]) {
    if (this.routes.containsKey(moduleName)) {
      this.routes[moduleName].add(route);
    } else {
      this.routes[moduleName] = [route];
    }
    return this;
  }

  NavigationController addRoutes(List<RouterAdapter> routes,
      [String moduleName = BFastUIConfig.DEFAULT_MODULE]) {
    this.routes[moduleName] = routes;
    return this;
  }

  to(String route){
    Modular.to.
  }
}
