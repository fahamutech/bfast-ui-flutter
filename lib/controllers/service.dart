import 'package:bfastui/adapters/service.dart';

import '../config.dart';

class BFastUIServiceController {
  static final BFastUIServiceController _instance = BFastUIServiceController._();

  factory BFastUIServiceController.getInstance() {
    return _instance;
  }

  BFastUIServiceController._();

  Map<String, List<BFastUIService>> _services = {};

  BFastUIServiceController addService(BFastUIService service,
      [String moduleName = BFastUIConfig.DEFAULT_MODULE]) {
    if (this._services.containsKey(moduleName)) {
      this._services[moduleName].add(service);
    } else {
      this._services[moduleName] = [service];
    }
    return this;
  }

  BFastUIServiceController addServices(List<BFastUIService> services,
      [String moduleName = BFastUIConfig.DEFAULT_MODULE]) {
    this._services[moduleName] = services;
    return this;
  }

  List<BFastUIService> getServices(
      [String moduleName = BFastUIConfig.DEFAULT_MODULE]) {
    return this._services[moduleName];
  }

  T getServiceByName<T extends BFastUIService>(String name,
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
