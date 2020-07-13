import 'package:bfastui/adapters/module.dart';
import 'package:bfastui/bfastui.dart';
import 'package:bfastui/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BFastUIModuleController extends BFastUIModule {
  final String initialPath;
  final String moduleName;

  BFastUIModuleController({
    this.moduleName = BFastUIConfig.DEFAULT_MODULE,
    this.initialPath = '/',
  });

  @override
  List<Bind> get binds =>
      (BFastUI.states(moduleName: this.moduleName).getAll() != null)
          ? BFastUI.states(moduleName: this.moduleName).getAll()
          : [];

  @override
  Widget get bootstrap => _AppWidget(this.initialPath);

  @override
  List<Router> get routers =>
      (BFastUI.navigation(moduleName: this.moduleName).getRoutes() != null)
          ? BFastUI.navigation(moduleName: this.moduleName)
              .getRoutes()
              .map<Router>((e) => Router(
                    e.routerName,
                    module: e.module != null ? e.module : null,
                    child: e.page != null
                        ? (context, args) => e.page(context, args).build(args)
                        : null,
                    params: e.params,
                    guards: e.guards,
                    modulePath: e.modulePath,
                    customTransition: e.customTransition,
                    transition: e.transition,
                  ))
              .toList()
          : [];

  @override
  StatefulWidget start({bool isCupertino = false}) {
    return ModularApp(module: this, isCupertino: isCupertino);
  }
}

class _AppWidget extends StatelessWidget {
  final String _initialPath;

  _AppWidget(this._initialPath);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: this._initialPath,
      navigatorKey: Modular.navigatorKey,
      onGenerateRoute: Modular.generateRoute,
    );
  }
}

class BFastUIChildModuleController extends BFastUIChildModule {
  final String moduleName;

  BFastUIChildModuleController(this.moduleName);

  @override
  List<Bind> get binds =>
      (BFastUI.states(moduleName: this.moduleName).getAll() != null)
          ? BFastUI.states(moduleName: this.moduleName).getAll()
          : [];

  @override
  List<Router> get routers =>
      (BFastUI.navigation(moduleName: this.moduleName).getRoutes() != null)
          ? BFastUI.navigation(moduleName: this.moduleName)
              .getRoutes()
              .map<Router>((e) => Router(
                    e.routerName,
                    module: e.module != null ? e.module : null,
                    child: e.page != null
                        ? (context, args) => e.page(context, args).build(args)
                        : null,
                    params: e.params,
                    guards: e.guards,
                    modulePath: e.modulePath,
                    customTransition: e.customTransition,
                    transition: e.transition,
                  ))
              .toList()
          : [];
}
