library bfastui;

import 'package:bfastui/adapters/component.dart';
import 'package:bfastui/adapters/module.dart';
import 'package:bfastui/config.dart';
import 'package:bfastui/controllers/component.dart';
import 'package:bfastui/controllers/module.dart';
import 'package:bfastui/controllers/navigation.dart';
import 'package:bfastui/controllers/state.dart';

class BFastUI {
  static BFastUIModule module({
    String name = BFastUIConfig.DEFAULT_MODULE,
    String initialPath = '/',
  }) {
    return BFastUIModuleController(
      moduleName: name,
      initialPath: initialPath,
    );
  }

  static BFastUIChildModule childModule(String name) {
    return BFastUIChildModuleController(name);
  }

  static NavigationController navigation(
      {String moduleName = BFastUIConfig.DEFAULT_MODULE}) {
    return NavigationController.getInstance(moduleName);
  }

//  static PageAdapter page([String moduleName = BFastUIConfig.DEFAULT_MODULE]) {
//    return PageController(moduleName);
//  }

  static BFastUIStateController states(
      {String moduleName = BFastUIConfig.DEFAULT_MODULE}) {
    return BFastUIStateController.getInstance(moduleName);
  }

  static BFastUIComponentController component() {
    return BFastUIComponentController();
  }
}
