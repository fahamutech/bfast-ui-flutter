import 'package:bfastui/adapters/child_module.dart';
import 'package:bfastui/config.dart';

abstract class MainModuleAdapter extends ChildModuleAdapter {
  @override
  String moduleName() => DEFAULT_MODULE;
}
