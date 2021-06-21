import 'package:bfastui/config.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'child-module.adapter.dart';

abstract class MainModuleAdapter extends Module implements ChildModuleAdapter {
  @override
  String moduleName() {
    return BFastUIConfig.DEFAULT_MODULE;
  }
}
