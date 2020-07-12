import 'package:bfastui/adapters/state.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../config.dart';

class BFastUIStateController {
  static final BFastUIStateController _instance = BFastUIStateController._();
  static String _moduleName = BFastUIConfig.DEFAULT_MODULE;

  factory BFastUIStateController.getInstance(
      [String moduleName = BFastUIConfig.DEFAULT_MODULE]) {
    _moduleName = moduleName;
    return _instance;
  }

  BFastUIStateController._();

  static final Map<String, List<BFastUIStateBinder>> _states = {};

  BFastUIStateController addState<T extends BFastUIState>(
      BFastUIStateBinder<T> bind) {
    print(T);
    assert(T != null, "State type required");
    if (_states.containsKey(_moduleName)) {
      _states[_moduleName].add(bind);
    } else {
      _states[_moduleName] = [bind];
    }
    return this;
  }

  List<BFastUIStateBinder> getAll() {
    return _states[_moduleName];
  }

  T getStateByName<T extends BFastUIState>(String name) {
    if (_states.containsKey(_moduleName)) {
      int serviceIndex =
          _states[_moduleName].indexWhere((element) => element.name == name);
      if (serviceIndex != null && serviceIndex != -1) {
        return _states[_moduleName][serviceIndex].inject(null) as T;
      } else {
        throw "service not found";
      }
    } else {
      throw "services for that module not found";
    }
  }
}

class BFastUIStateBinder<T> extends Bind<T> {
  String name;

  BFastUIStateBinder(T Function(Inject i) inject, this.name,
      {bool singleton = true, bool lazy = true})
      : super(inject, singleton: singleton, lazy: lazy);
}
