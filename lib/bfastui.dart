library bfastui;

import 'package:bfastui/adapters/module.dart';
import 'package:bfastui/adapters/router.dart';
import 'package:bfastui/adapters/service.dart';
import 'package:bfastui/config.dart';
import 'package:bfastui/controllers/component.dart';
import 'package:bfastui/controllers/module.dart';
import 'package:bfastui/controllers/navigation.dart';
import 'package:bfastui/controllers/service.dart';

class BFastUI {
  static BFastUIModule module({
    String name = BFastUIConfig.DEFAULT_MODULE,
    path = '/',
    List<BFastUIService> services,
    List<BFastUIRouter> routes,
  }) {
    return ModuleController(path: path, services: services, routers: routes);
  }

  static NavigationController navigation(
  {String moduleName = BFastUIConfig.DEFAULT_MODULE}) {
    return NavigationController.getInstance();
  }

//  static PageAdapter page([String moduleName = BFastUIConfig.DEFAULT_MODULE]) {
//    return PageController(moduleName);
//  }

  static BFastUIServiceController state({String moduleName = BFastUIConfig.DEFAULT_MODULE}) {
    return BFastUIServiceController.getInstance();
  }

  static component({String moduleName = BFastUIConfig.DEFAULT_MODULE}) {
    return BFastUIComponentController();
  }
}
