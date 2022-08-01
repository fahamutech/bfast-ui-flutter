import 'package:bfastui/adapters/main_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

ModularApp bfastUiApp({
  required MainModuleAdapter module,
  required MaterialApp component,
}) =>
    ModularApp(module: module, child: component);
