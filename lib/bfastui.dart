library bfastui;

import 'package:bfastui/adapters/module.dart';
import 'package:bfastui/config.dart';
import 'package:bfastui/controllers/component.dart';
import 'package:bfastui/controllers/module.dart';
import 'package:bfastui/controllers/navigation.dart';
import 'package:bfastui/controllers/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BFastUI {
  static BFastUIModule module({
    String name = BFastUIConfig.DEFAULT_MODULE,
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
    Map<Type, Action<Intent>> actions,
  }) {
    return BFastUIModuleController(
      moduleName: name,
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
      actions: actions,
    );
  }

  static BFastUIChildModule childModule(String name) {
    return BFastUIChildModuleController(name);
  }

  static NavigationController navigation(
      {String moduleName = BFastUIConfig.DEFAULT_MODULE}) {
    return NavigationController.getInstance(moduleName);
  }

//  static PageAdapter page([String moduleName = BFastUIConfig.DEFAULT_MODULE]) {
//    return PageController(moduleName);
//  }

  static BFastUIStateController states(
      {String moduleName = BFastUIConfig.DEFAULT_MODULE}) {
    return BFastUIStateController.getInstance(moduleName);
  }

  static BFastUIComponentController component() {
    return BFastUIComponentController();
  }
}
