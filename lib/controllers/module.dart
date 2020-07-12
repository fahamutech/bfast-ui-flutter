import 'package:bfastui/adapters/module.dart';
import 'package:bfastui/bfastui.dart';
import 'package:bfastui/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BFastUIModuleController extends BFastUIModule {
  final String path;
  final String moduleName;

  BFastUIModuleController({
    this.moduleName = BFastUIConfig.DEFAULT_MODULE,
    this.path = '/',
  });

  @override
  List<Bind> get binds =>
      (BFastUI.state(moduleName: this.moduleName).getStates() != null)
          ? BFastUI.state(moduleName: this.moduleName)
              .getStates()
              .map<Bind>((e) =>
                  Bind((_) => e.injector(), singleton: e.singleton, lazy: e.lazy))
              .toList()
          : [];

  @override
  Widget get bootstrap => _AppWidget(this.path);

  @override
  List<Router> get routers =>
      (BFastUI.navigation(moduleName: this.moduleName).getRoutes() != null)
          ? BFastUI.navigation(moduleName: this.moduleName)
              .getRoutes()
              .map<Router>((e) => Router(
                    this.path,
                    module: e.module,
                    child: (context, args) => e.page(context, args).build(args),
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
    return ModularApp(module: this.getModule(), isCupertino: isCupertino);
  }

  @override
  BFastUIModule getModule() {
    return this;
  }
}

class _AppWidget extends StatelessWidget {
  final String _initialPath;

  _AppWidget(this._initialPath);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: this._initialPath,
      navigatorKey: Modular.navigatorKey,
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
