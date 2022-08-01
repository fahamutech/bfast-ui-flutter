import 'package:bfastui/adapters/module.dart';
import 'package:bfastui/utils/guard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';

abstract class ChildModuleAdapter extends Module implements ModuleAdapter {
  @override
  List<Bind> get binds => this
      .initStates(this.moduleName())
      .map<Bind>(
        (state) => Bind.lazySingleton(
          (_i) => state,
          onDispose: (_s) => state.onDispose(),
        ),
      )
      .toList();

  @override
  List<ModularRoute> get routes => this
      .initRoutes(this.moduleName())
      .map<ModularRoute>(
        (route) => route.module != null
            ? ModuleRoute(
                route.routerName,
                module: route.module as Module,
                customTransition: route.customTransition,
                transition: route.transition,
              )
            : ChildRoute(
                route.routerName,
                child: route.page != null
                    ? (c, args) => pageGuardWrapper(route, c, args)
                    : (c, a) => Container(),
                customTransition: route.customTransition,
                transition: route.transition,
              ),
      )
      .toList();
}
