import 'package:bfastui/adapters/service.dart';

import '../config.dart';

class StateController {
  static final StateController _instance = StateController._();

  factory StateController.getInstance() {
    return _instance;
  }

  StateController._();

  Map<String, List<StateAdapter>> _services = {};

  StateController addService(StateAdapter service,
      [String moduleName = BFastUIConfig.DEFAULT_MODULE]) {
    if (this._services.containsKey(moduleName)) {
      this._services[moduleName].add(service);
    } else {
      this._services[moduleName] = [service];
    }
    return this;
  }

  StateController addServices(List<StateAdapter> services,
      [String moduleName = BFastUIConfig.DEFAULT_MODULE]) {
    this._services[moduleName] = services;
    return this;
  }

  List<StateAdapter> getServices(
      [String moduleName = BFastUIConfig.DEFAULT_MODULE]) {
    return this._services[moduleName];
  }

  T getServiceByName<T extends StateAdapter>(String name,
      {String moduleName = BFastUIConfig.DEFAULT_MODULE}) {
    if (this._services.containsKey(moduleName)) {
      int serviceIndex = this
          ._services[moduleName]
          .indexWhere((element) => element.name == name);
      if (serviceIndex != null && serviceIndex != -1) {
        return this._services[moduleName][serviceIndex];
      } else {
        throw "service not found";
      }
    } else {
      throw "services for that module not found";
    }
  }
}
