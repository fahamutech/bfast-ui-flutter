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
    final Route Function(RouteSettings settings) onUnknownRoute,
    final String title,
    final Color color,
    final ThemeData theme,
    final ThemeData darkTheme,
    final ThemeMode themeMode,
    final Locale locale,
    final Iterable<LocalizationsDelegate> localizationsDelegates,
    final Locale Function(List<Locale>, Iterable<Locale>)
        localeListResolutionCallback,
    final Locale Function(Locale, Iterable<Locale>) localeResolutionCallback,
    final Iterable<Locale> supportedLocales,
    final bool debugShowMaterialGrid,
    final bool showPerformanceOverlay,
    final bool checkerboardRasterCacheImages,
    final bool checkerboardOffscreenLayers,
    final bool showSemanticsDebugger,
    final bool debugShowCheckedModeBanner,
    final Map<LogicalKeySet, Intent> shortcuts,
    final Map<Type, Action<Intent>> actions,
  }) {
    return BFastUIModuleController(
      moduleName: name,
      initialPath: initialPath,
      debugShowCheckedModeBanner: debugShowCheckedModeBanner,
      actions: actions,
      shortcuts: shortcuts,
      checkerboardRasterCacheImages: checkerboardRasterCacheImages,
      showSemanticsDebugger: showSemanticsDebugger,
      checkerboardOffscreenLayers: checkerboardOffscreenLayers,
      showPerformanceOverlay: showPerformanceOverlay,
      debugShowMaterialGrid: debugShowMaterialGrid,
      supportedLocales: supportedLocales,
      localeResolutionCallback: localeResolutionCallback,
      localeListResolutionCallback: localeListResolutionCallback,
      localizationsDelegates: localizationsDelegates,
      locale: locale,
      themeMode: themeMode,
      darkTheme: darkTheme,
      theme: theme,
      color: color,
      title: title,
      onUnknownRoute: onUnknownRoute,
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
