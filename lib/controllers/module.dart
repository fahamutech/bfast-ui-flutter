import 'package:bfastui/adapters/module.dart';
import 'package:bfastui/adapters/router.dart';
import 'package:bfastui/bfastui.dart';
import 'package:bfastui/config.dart';
import 'package:flutter/cupertino.dart';
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
                        ? (context, args) =>
                            _getPageGuardWrapper(e, context, args)
                        : null,
                    params: e.params,
//                    guards: [],
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
                        ? (context, args) =>
                            _getPageGuardWrapper(e, context, args)
                        : null,
                    params: e.params,
//                    guards: [],
                    modulePath: e.modulePath,
                    customTransition: e.customTransition,
                    transition: e.transition,
                  ))
              .toList()
          : [];
}

FutureBuilder _getPageGuardWrapper(
  BFastUIRouter router,
  BuildContext context,
  ModularArguments args,
) {
  List<Future<bool>> allGuards =
      router.guards != null && router.guards.length != 0
          ? router.guards.map((e) => e.canActivate(router.routerName)).toList()
          : [Future<bool>.value(true)];
  return FutureBuilder(
    future: Future.wait<bool>(allGuards),
    builder: (_, snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        bool data = snapshot.data?.reduce((value, element) => value && element);
        if (snapshot.hasData == true && data == true) {
          return router.page(context, args).build(args);
        } else {
          try {
            Modular.to.maybePop();
          } catch (e) {
            // print(e.toString());
          }
          return Container(color: Colors.white);
        }
      } else {
        return router.onGuardCheck != null
            ? router.onGuardCheck
            : Container(color: Colors.white);
      }
    },
  );
}
