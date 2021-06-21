import 'package:bfastui/adapters/main-module.adapter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';

typedef MaterialApp _Bootstrap();

class _AppWidget extends StatelessWidget {
  final MaterialApp _component;

  _AppWidget(this._component);

  @override
  Widget build(BuildContext context) {
    return this._component.modular();
  }
}

class MainModuleController {
  final MainModuleAdapter module;
  final _Bootstrap component;

  MainModuleController({@required this.module, @required this.component});

  // starting a main app
  Widget start() {
    this.module.initStates(module.moduleName());
    this.module.initRoutes(module.moduleName());

    return ModularApp(
      module: this.module,
      child: _AppWidget(this.component()),
    );
  }
}
