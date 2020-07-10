library bfastui;

import 'package:bfastui/adapters/module.dart';
import 'package:bfastui/adapters/page.dart';
import 'package:bfastui/adapters/router.dart';
import 'package:bfastui/adapters/service.dart';
import 'package:bfastui/config.dart';
import 'package:bfastui/controllers/component.dart';
import 'package:bfastui/controllers/module.dart';
import 'package:bfastui/controllers/navigation.dart';
import 'package:bfastui/controllers/page.dart';
import 'package:bfastui/controllers/service.dart';

class BFastUI {
  static ModuleAdapter module({
    String name = BFastUIConfig.DEFAULT_MODULE,
    path = '/',
    List<StateAdapter> services,
    List<RouterAdapter> routes,
  }) {
    return ModuleController(path: path, services: services, routers: routes);
  }

  static NavigationController navigation(
      [String moduleName = BFastUIConfig.DEFAULT_MODULE]) {
    return NavigationController.getInstance();
  }

  static PageAdapter page([String moduleName = BFastUIConfig.DEFAULT_MODULE]) {
    return PageController(moduleName);
  }

  static state([String moduleName = BFastUIConfig.DEFAULT_MODULE]) {
    return StateController.getInstance();
  }

  static component([String moduleName = BFastUIConfig.DEFAULT_MODULE]) {
    return ComponentController();
  }
}
