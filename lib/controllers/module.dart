import 'package:bfastui/adapters/module.dart';
import 'package:bfastui/adapters/router.dart';
import 'package:bfastui/bfastui.dart';
import 'package:bfastui/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BFastUIMainModuleController {
  final BFastUIMainModule module;

  BFastUIMainModuleController({@required this.module});

  // starting a main app
  Widget start({
    bool isCupertino = false,
    String initialPath = '/',
    Route Function(RouteSettings settings) onUnknownRoute,
    String title = '',
    Color color,
    ThemeData theme,
    ThemeData darkTheme,
    ThemeMode themeMode = ThemeMode.system,
    Locale locale,
    Iterable<LocalizationsDelegate> localizationsDelegates,
    Locale Function(List<Locale>, Iterable<Locale>)
        localeListResolutionCallback,
    Locale Function(Locale, Iterable<Locale>) localeResolutionCallback,
    Iterable<Locale> supportedLocales = const <Locale>[Locale('en', 'US')],
    bool debugShowMaterialGrid = false,
    bool showPerformanceOverlay = false,
    bool checkerboardRasterCacheImages = false,
    bool checkerboardOffscreenLayers = false,
    bool showSemanticsDebugger = false,
    bool debugShowCheckedModeBanner = true,
    Map<LogicalKeySet, Intent> shortcuts,
  }) {
    this.module.initStates(module.moduleName());
    this.module.initRoutes(module.moduleName());

//    // this must be in respective modules when initialized
//    if (this.modules != null &&
//        this.modules is List<BFastUIChildModule> &&
//        this.modules.length > 0) {
//      this.modules.forEach((module) {
//        module.initStates(module.moduleName());
//        module.initRoutes(module.moduleName());
//      });
//    }

    return ModularApp(
        module: _MainModule(
          moduleName: module.moduleName(),
          initialPath: initialPath,
          onUnknownRoute: onUnknownRoute,
          title: title,
          color: color,
          theme: theme,
          darkTheme: darkTheme,
          themeMode: themeMode,
          locale: locale,
          localizationsDelegates: localizationsDelegates,
          localeListResolutionCallback: localeListResolutionCallback,
          localeResolutionCallback: localeResolutionCallback,
          supportedLocales: supportedLocales,
          debugShowMaterialGrid: debugShowMaterialGrid,
          showPerformanceOverlay: showPerformanceOverlay,
          checkerboardRasterCacheImages: checkerboardRasterCacheImages,
          checkerboardOffscreenLayers: checkerboardOffscreenLayers,
          showSemanticsDebugger: showSemanticsDebugger,
          debugShowCheckedModeBanner: debugShowCheckedModeBanner,
          shortcuts: shortcuts,
        ),
        isCupertino: isCupertino);
  }
}

class _MainModule extends MainModule {
  String initialPath;
  String moduleName;
  Route Function(RouteSettings settings) onUnknownRoute;
  String title;
  Color color;
  ThemeData theme;
  ThemeData darkTheme;
  ThemeMode themeMode;
  Locale locale;
  Iterable<LocalizationsDelegate> localizationsDelegates;
  Locale Function(List<Locale>, Iterable<Locale>) localeListResolutionCallback;
  Locale Function(Locale, Iterable<Locale>) localeResolutionCallback;
  Iterable<Locale> supportedLocales;
  bool debugShowMaterialGrid;
  bool showPerformanceOverlay;
  bool checkerboardRasterCacheImages;
  bool checkerboardOffscreenLayers;
  bool showSemanticsDebugger;
  bool debugShowCheckedModeBanner;
  Map<LogicalKeySet, Intent> shortcuts;

  _MainModule({
    this.moduleName = BFastUIConfig.DEFAULT_MODULE,
    this.initialPath = '/',
    this.onUnknownRoute,
    this.title,
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
  });

  @override
  List<Bind> get binds {
    return (BFastUI.states(moduleName: this.moduleName).getAll() != null)
        ? BFastUI.states(moduleName: this.moduleName).getAll()
        : [];
  }

  @override
  List<Router> get routers {
    return (BFastUI.navigation(moduleName: this.moduleName).getRoutes() != null)
        ? BFastUI.navigation(moduleName: this.moduleName)
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

  @override
  Widget get bootstrap {
    return _MainModuleBootstrapApp(
      this.initialPath,
      debugShowCheckedModeBanner: this.debugShowCheckedModeBanner,
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
  }
}

class _MainModuleBootstrapApp extends StatelessWidget {
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

  _MainModuleBootstrapApp(
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
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: this.debugShowCheckedModeBanner,
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

class BFastUIChildModuleController {
  BFastUIChildModule module;

  BFastUIChildModuleController({@required this.module});

  ChildModule start() {
    module.initStates(module.moduleName());
    module.initRoutes(module.moduleName());
    return this.module;
  }
}

FutureBuilder pageGuardWrapper(
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
          } catch (e) {}
          return Container(color: Colors.white);
        }
      } else {
        return router.onGuardCheck != null
            ? router.onGuardCheck
            : Container(
                color: Colors.white,
                child: CircularProgressIndicator(),
                alignment: Alignment.center,
              );
      }
    },
  );
}
