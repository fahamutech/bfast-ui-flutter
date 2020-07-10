import 'package:bfastui/adapters/module.dart';
import 'package:bfastui/adapters/router.dart';
import 'package:bfastui/adapters/service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ModuleController extends ModuleAdapter {
  final String path;
  List<StateAdapter> _services;
  List<RouterAdapter> _routers;

  ModuleController({
    this.path = '/',
    List<StateAdapter> services,
    List<RouterAdapter> routers,
  }) {
    this._services = services;
    this._routers = routers;
  }

  @override
  List<Bind> get binds => (this._services != null)
      ? this
          ._services
          .map<Bind>(
              (e) => Bind(e.inject, singleton: e.singleton, lazy: e.lazy))
          .toList()
      : [];

  @override
  Widget get bootstrap => _AppWidget(this.path);

  @override
  List<Router> get routers => (this._routers != null)
      ? this
          ._routers
          .map<Router>((e) => Router(
                this.path,
                module: e.module,
                child: (context, args) => e.page(context, args).widget,
                params: e.params,
                guards: e.guards,
                modulePath: e.modulePath,
                customTransition: e.customTransition,
                transition: e.transition,
              ))
          .toList()
      : [];

  @override
  start({bool isCupertino = false}) {
    ModularApp(module: this, isCupertino: isCupertino);
  }

  @override
  ModuleAdapter getModule() {
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
