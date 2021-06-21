import 'package:bfastui/adapters/module.adapter.dart';
import 'package:bfastui/bfastui.dart';
import 'package:bfastui/config.dart';
import 'package:bfastui/utils/guard.util.dart';
import 'package:flutter_modular/flutter_modular.dart';

abstract class MainModuleAdapter extends Module implements ModuleAdapter {
  @override
  String moduleName() {
    return BFastUIConfig.DEFAULT_MODULE;
  }

  @override
  List<Bind> get binds {
    this.initStates(this.moduleName());
    return (BFastUI.states(moduleName: this.moduleName()).getAll() != null)
        ? BFastUI.states(moduleName: this.moduleName()).getAll()
        : [];
  }

  @override
  List<ModularRoute> get routes {
    this.initRoutes(this.moduleName());
    return (BFastUI.navigation(moduleName: this.moduleName()).getRoutes() !=
            null)
        ? BFastUI.navigation(moduleName: this.moduleName())
            .getRoutes()
            .map<ModularRoute>(
              (route) => route.module != null
                  ? ModuleRoute(
                      route.routerName,
                      module: route.module.start(),
                      customTransition: route.customTransition,
                      transition: route.transition,
                    )
                  : ChildRoute(
                      route.routerName,
                      child: route.page != null
                          ? (context, args) =>
                              pageGuardWrapper(route, context, args)
                          : null,
                      customTransition: route.customTransition,
                      transition: route.transition,
                    ),
            )
            .toList()
        : [];
  }
}
