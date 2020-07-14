import 'package:bfastui/adapters/module.dart';
import 'package:bfastui/adapters/router.dart';
import 'package:bfastui/bfastui.dart';
import 'package:bfastui/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BFastUIModuleController extends BFastUIModule {
  final String initialPath;
  final String moduleName;
  final Route Function(RouteSettings settings) onUnknownRoute;
  final String title;
  final Color color;
  final ThemeData theme;
  final ThemeData darkTheme;
  final ThemeMode themeMode;
  final Locale locale;
  final Iterable<LocalizationsDelegate> localizationsDelegates;
  final Locale Function(List<Locale>, Iterable<Locale>)
      localeListResolutionCallback;
  final Locale Function(Locale, Iterable<Locale>) localeResolutionCallback;
  final Iterable<Locale> supportedLocales;
  final bool debugShowMaterialGrid;
  final bool showPerformanceOverlay;
  final bool checkerboardRasterCacheImages;
  final bool checkerboardOffscreenLayers;
  final bool showSemanticsDebugger;
  final bool debugShowCheckedModeBanner;
  final Map<LogicalKeySet, Intent> shortcuts;
  final Map<Type, Action<Intent>> actions;

  BFastUIModuleController({
    this.moduleName = BFastUIConfig.DEFAULT_MODULE,
    this.initialPath = '/',
    this.onUnknownRoute,
    this.title = '',
    this.color,
    this.theme,
    this.darkTheme,
    this.themeMode = ThemeMode.system,
    this.locale,
    this.localizationsDelegates,
    this.localeListResolutionCallback,
    this.localeResolutionCallback,
    this.supportedLocales = const <Locale>[Locale('en', 'US')],
    this.debugShowMaterialGrid = false,
    this.showPerformanceOverlay = false,
    this.checkerboardRasterCacheImages = false,
    this.checkerboardOffscreenLayers = false,
    this.showSemanticsDebugger = false,
    this.debugShowCheckedModeBanner = true,
    this.shortcuts,
    this.actions,
  });

  @override
  List<Bind> get binds =>
      (BFastUI.states(moduleName: this.moduleName).getAll() != null)
          ? BFastUI.states(moduleName: this.moduleName).getAll()
          : [];

  @override
  Widget get bootstrap => _AppWidget(
        this.initialPath,
        debugShowCheckedModeBanner: this.debugShowCheckedModeBanner,
        actions: this.actions,
        shortcuts: this.shortcuts,
        checkerboardRasterCacheImages: this.checkerboardRasterCacheImages,
        showSemanticsDebugger: this.showSemanticsDebugger,
        checkerboardOffscreenLayers: this.checkerboardOffscreenLayers,
        showPerformanceOverlay: this.showPerformanceOverlay,
        debugShowMaterialGrid: this.debugShowMaterialGrid,
        supportedLocales: this.supportedLocales,
        localeResolutionCallback: this.localeResolutionCallback,
        localeListResolutionCallback: this.localeListResolutionCallback,
        localizationsDelegates: this.localizationsDelegates,
        locale: this.locale,
        themeMode: this.themeMode,
        darkTheme: this.darkTheme,
        theme: this.theme,
        color: this.color,
        title: this.title,
        onUnknownRoute: this.onUnknownRoute,
      );

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
  StatefulWidget start({
    bool isCupertino = false,
  }) {
    return ModularApp(module: this, isCupertino: isCupertino);
  }
}

class _AppWidget extends StatelessWidget {
  final String _initialPath;
  final Route Function(RouteSettings settings) onUnknownRoute;
  final String title;
  final Color color;
  final ThemeData theme;
  final ThemeData darkTheme;
  final ThemeMode themeMode;
  final Locale locale;
  final Iterable<LocalizationsDelegate> localizationsDelegates;
  final Locale Function(List<Locale>, Iterable<Locale>)
      localeListResolutionCallback;
  final Locale Function(Locale, Iterable<Locale>) localeResolutionCallback;
  final Iterable<Locale> supportedLocales;
  final bool debugShowMaterialGrid;
  final bool showPerformanceOverlay;
  final bool checkerboardRasterCacheImages;
  final bool checkerboardOffscreenLayers;
  final bool showSemanticsDebugger;
  final bool debugShowCheckedModeBanner;
  final Map<LogicalKeySet, Intent> shortcuts;
  final Map<Type, Action<Intent>> actions;

  _AppWidget(
    this._initialPath, {
    this.onUnknownRoute,
    this.title = '',
    this.color,
    this.theme,
    this.darkTheme,
    this.themeMode = ThemeMode.system,
    this.locale,
    this.localizationsDelegates,
    this.localeListResolutionCallback,
    this.localeResolutionCallback,
    this.supportedLocales = const <Locale>[Locale('en', 'US')],
    this.debugShowMaterialGrid = false,
    this.showPerformanceOverlay = false,
    this.checkerboardRasterCacheImages = false,
    this.checkerboardOffscreenLayers = false,
    this.showSemanticsDebugger = false,
    this.debugShowCheckedModeBanner = true,
    this.shortcuts,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: this.debugShowCheckedModeBanner,
      actions: this.actions,
      shortcuts: this.shortcuts,
      showSemanticsDebugger: this.showSemanticsDebugger,
      checkerboardOffscreenLayers: this.checkerboardOffscreenLayers,
      checkerboardRasterCacheImages: this.checkerboardRasterCacheImages,
      showPerformanceOverlay: this.showPerformanceOverlay,
      debugShowMaterialGrid: this.debugShowMaterialGrid,
      supportedLocales: this.supportedLocales,
      localeResolutionCallback: this.localeResolutionCallback,
      localeListResolutionCallback: this.localeListResolutionCallback,
      localizationsDelegates: this.localizationsDelegates,
      locale: this.locale,
      themeMode: this.themeMode,
      darkTheme: this.darkTheme,
      theme: this.theme,
      color: this.color,
      title: this.title,
      onUnknownRoute: this.onUnknownRoute,
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
