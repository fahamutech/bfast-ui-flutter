library bfastui;

import 'package:bfastui/adapters/child-module.adapter.dart';
import 'package:bfastui/adapters/main-module.adapter.dart';
import 'package:bfastui/adapters/state.adapter.dart';
import 'package:bfastui/controllers/child-module.controller.dart';
import 'package:bfastui/controllers/component.controller.dart';
import 'package:bfastui/controllers/main-module.controller.dart';
import 'package:bfastui/controllers/navigation.controller.dart';
import 'package:bfastui/controllers/state.controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BFastUI {
  static MainModuleController init({@required MainModuleAdapter module, @required MaterialApp component}) {
    return MainModuleController(module: module, component: ()=>component);
  }

  static ChildModuleController childModule(ChildModuleAdapter module) {
    return ChildModuleController(module: module);
  }

  static NavigationController navigation({@required String moduleName}) {
    return NavigationController.getInstance(moduleName);
  }

  static void navigateTo(String routeName) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Modular.to.pushNamed(routeName);
    });
  }

  static void navigateToAndReplace(String routeName) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Modular.to.pushReplacementNamed(routeName);
    });
  }

  static IModularNavigator navigator() {
    return Modular.to;
  }

  static StateController states({@required String moduleName}) {
    return StateController.getInstance(moduleName);
  }

  static T getState<T extends StateAdapter>() {
    assert(T.toString() != 'BFastUIState',
        "please tell us the implementation of BFastUIState. For example getState<your implementation here>()");
    return Modular.get<T>();
  }

  static ComponentController component() {
    return ComponentController();
  }
}
