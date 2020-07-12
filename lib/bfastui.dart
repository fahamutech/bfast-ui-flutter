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
    path = '/',
  }) {
    return BFastUIModuleController(
      moduleName: name,
      path: path,
    );
  }

  static NavigationController navigation(
      {String moduleName = BFastUIConfig.DEFAULT_MODULE}) {
    return NavigationController.getInstance();
  }

//  static PageAdapter page([String moduleName = BFastUIConfig.DEFAULT_MODULE]) {
//    return PageController(moduleName);
//  }

  static BFastUIStateController state(
      {String moduleName = BFastUIConfig.DEFAULT_MODULE}) {
    return BFastUIStateController.getInstance();
  }

  static BFastUIComponent component(
      {String moduleName = BFastUIConfig.DEFAULT_MODULE}) {
    return BFastUIComponentController();
  }
}
