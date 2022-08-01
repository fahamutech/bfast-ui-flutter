import 'package:bfastui/adapters/router.dart';
import 'package:bfastui/adapters/state.dart';

abstract class ModuleAdapter {
  List<StateAdapter> initStates(String moduleName);
  String moduleName();
  List<RouterAdapter> initRoutes(String moduleName);
}
