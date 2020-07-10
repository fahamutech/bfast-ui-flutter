import 'package:flutter_modular/flutter_modular.dart';

abstract class ModuleAdapter extends MainModule {
  start();
  ModuleAdapter getModule();
}
