import 'package:bfastui/config.dart';
import 'package:bfastui/controllers/module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../bfastui.dart';

abstract class _BFastUIModule {
  void initStates(String moduleName);

  String moduleName();

  void initRoutes(String moduleName);
}

abstract class BFastUIMainModule extends _BFastUIModule {
  @override
  String moduleName() {
    return BFastUIConfig.DEFAULT_MODULE;
  }
}

abstract class BFastUIChildModule extends ChildModule
    implements _BFastUIModule {
  @override
  List<Bind> get binds {
    this.initStates(this.moduleName());
    return (BFastUI.states(moduleName: this.moduleName()).getAll() != null)
        ? BFastUI.states(moduleName: this.moduleName()).getAll()
        : [];
  }

  @override
  List<Router> get routers {
    this.initRoutes(this.moduleName());
    return (BFastUI.navigation(moduleName: this.moduleName()).getRoutes() !=
            null)
        ? BFastUI.navigation(moduleName: this.moduleName())
            .getRoutes()
            .map<Router>((e) => Router(
                  e.routerName,
                  module: e.module != null ? e.module.start() : null,
                  child: e.page != null
                      ? (context, args) => pageGuardWrapper(e, context, args)
                      : null,
                  params: e.params,
                  modulePath: e.modulePath,
                  customTransition: e.customTransition,
                  transition: e.transition,
                ))
            .toList()
        : [];
  }
}
