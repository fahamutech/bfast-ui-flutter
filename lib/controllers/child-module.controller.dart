import 'package:bfastui/adapters/child-module.adapter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ChildModuleController {
  final ChildModuleAdapter module;

  ChildModuleController({@required this.module});

  Module start() {
    return this.module;
  }
}
