library bfastui;

import 'package:bfastui/adapters/module.dart';
import 'package:bfastui/adapters/page.dart';
import 'package:bfastui/adapters/router.dart';
import 'package:bfastui/config.dart';
import 'package:bfastui/controllers/module.dart';
import 'package:bfastui/controllers/page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BFastUI {
  static ModuleAdapter module({
    String name = BFastUIConfig.DEFAULT_MODULE,
    path = '/',
    List<Bind> services,
    List<RouterAdapter> routes,
  }) {
    return ModuleController(path: path, services: services, routers: routes);
  }

  static navigation([String moduleName = BFastUIConfig.DEFAULT_MODULE]) {}

  static PageAdapter page([String moduleName = BFastUIConfig.DEFAULT_MODULE]) {
    return PageController(moduleName);
  }

  static state([String moduleName = BFastUIConfig.DEFAULT_MODULE]) {}

  static component([String moduleName = BFastUIConfig.DEFAULT_MODULE]) {}
}
