library bfastui;

import 'package:bfastui/adapters/module.dart';
import 'package:bfastui/controllers/component.dart';
import 'package:bfastui/controllers/module.dart';
import 'package:bfastui/controllers/navigation.dart';
import 'package:bfastui/controllers/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BFastUI {
  static BFastUIMainModuleController module(BFastUIMainModule module) {
    return BFastUIMainModuleController(module: module);
  }

  static BFastUIChildModuleController childModule(BFastUIChildModule module) {
    return BFastUIChildModuleController(module: module);
  }

  static NavigationController navigation({@required String moduleName}) {
    return NavigationController.getInstance(moduleName);
  }

  static BFastUIStateController states({@required String moduleName}) {
    return BFastUIStateController.getInstance(moduleName);
  }

  static BFastUIComponentController component() {
    return BFastUIComponentController();
  }
}
