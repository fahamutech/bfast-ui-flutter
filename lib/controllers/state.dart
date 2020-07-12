import 'package:bfastui/adapters/state.dart';

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

  BFastUIStateController addState(BFastUIStateBinder stateBinder) {
    if (_states.containsKey(_moduleName)) {
      _states[_moduleName].add(stateBinder);
    } else {
      _states[_moduleName] = [stateBinder];
    }
    return this;
  }

//  BFastUIServiceController addServices(List<BFastUIService> services,
//      [String moduleName = BFastUIConfig.DEFAULT_MODULE]) {
//    this._services[moduleName] = services;
//    return this;
//  }

  List<BFastUIStateBinder> getStates() {
    return _states[_moduleName];
  }

  T getStateByName<T extends BFastUIState>(String name) {
    if (_states.containsKey(_moduleName)) {
      int serviceIndex = _states[_moduleName]
          .indexWhere((element) => element.injector().serviceName == name);
      if (serviceIndex != null && serviceIndex != -1) {
        return _states[_moduleName][serviceIndex].injector();
      } else {
        throw "service not found";
      }
    } else {
      throw "services for that module not found";
    }
  }
}

class BFastUIStateBinder {
  T Function<T extends BFastUIState>() injector;
  bool singleton = true;
  bool lazy = true;

  BFastUIStateBinder(
    this.injector, {
    this.singleton = true,
    this.lazy = true,
  });
}
