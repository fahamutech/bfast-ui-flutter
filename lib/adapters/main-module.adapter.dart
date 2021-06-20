import 'package:bfastui/adapters/module.adapter.dart';
import 'package:bfastui/bfastui.dart';
import 'package:bfastui/config.dart';
import 'package:flutter_modular/flutter_modular.dart';

abstract class MainModuleAdapter extends Module implements ModuleAdapter {
  @override
  String moduleName() {
    return BFastUIConfig.DEFAULT_MODULE;
  }

  @override
  List<Bind> get binds {
    return [];
  }

  @override
  List<ModularRoute> get routes {
    this.initRoutes(this.moduleName());
    return (BFastUI.navigation(moduleName: this.moduleName()).getRoutes() !=
            null)
        ? BFastUI.navigation(moduleName: this.moduleName())
            .getRoutes()
            .where((element) => element.module != null).toList()
            .map<ModularRoute>(
              (route) => ModuleRoute(
                route.routerName,
                module: route.module.start(),
                customTransition: route.customTransition,
                transition: route.transition,
              ),
            )
            .toList()
        : [];
  }
}
