import 'package:bfastui/adapters/service.dart';

import '../config.dart';

class BFastUIServiceController {
  static final BFastUIServiceController _instance =
      BFastUIServiceController._();
  static String _moduleName = BFastUIConfig.DEFAULT_MODULE;

  factory BFastUIServiceController.getInstance(
      [String moduleName = BFastUIConfig.DEFAULT_MODULE]) {
    _moduleName = moduleName;
    return _instance;
  }

  BFastUIServiceController._();

  static final Map<String, List<BFastUIService>> _services = {};

  BFastUIServiceController addService(BFastUIService service) {
    if (_services.containsKey(_moduleName)) {
      _services[_moduleName].add(service);
    } else {
      _services[_moduleName] = [service];
    }
    return this;
  }

//  BFastUIServiceController addServices(List<BFastUIService> services,
//      [String moduleName = BFastUIConfig.DEFAULT_MODULE]) {
//    this._services[moduleName] = services;
//    return this;
//  }

  List<BFastUIService> getServices() {
    return _services[_moduleName];
  }

  T getServiceByName<T extends BFastUIService>(String name) {
    if (_services.containsKey(_moduleName)) {
      int serviceIndex = _services[_moduleName]
          .indexWhere((element) => element.serviceName == name);
      if (serviceIndex != null && serviceIndex != -1) {
        return _services[_moduleName][serviceIndex];
      } else {
        throw "service not found";
      }
    } else {
      throw "services for that module not found";
    }
  }
}
