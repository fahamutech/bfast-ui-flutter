library bfastui;

import 'package:bfastui/adapters/module.dart';
import 'package:bfastui/adapters/state.dart';
import 'package:bfastui/controllers/component.dart';
import 'package:bfastui/controllers/module.dart';
import 'package:bfastui/controllers/navigation.dart';
import 'package:bfastui/controllers/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';

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

  static void navigateTo(String routeName) {
    Modular.to.pushNamed(routeName);
  }

  static void navigateToAndReplace(String routeName) {
    Modular.to.pushReplacementNamed(routeName);
  }

  static IModularNavigator navigator() {
    return Modular.to;
  }

  static BFastUIStateController states({@required String moduleName}) {
    return BFastUIStateController.getInstance(moduleName);
  }

  static T getState<T extends BFastUIState>(){
    assert(T.toString() != 'BFastUIState',
    "please tell us the implementation of BFastUIState. For example get<your implementation here>()");
    return Modular.get<T>();
  }

  static BFastUIComponentController component() {
    return BFastUIComponentController();
  }
}
