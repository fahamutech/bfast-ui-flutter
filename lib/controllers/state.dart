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

  static final Map<String, List<Bind>> _states = {};

  BFastUIStateController addState<T extends BFastUIState>(
      BFastUIStateBinder<T> bind) {
    assert(T != null, "State type required");
    if (_states.containsKey(_moduleName)) {
      _states[_moduleName].add(bind);
    } else {
      _states[_moduleName] = [bind];
    }
    _states[_moduleName].toSet().toList();
    return this;
  }

  List<Bind> getAll() {
    return _states[_moduleName];
  }

  T get<T extends BFastUIState>() {
    assert(T.toString() != 'BFastUIState',
        "please tell us the implementation of BFastUIState. For example get<your implementation here>()");
    return Modular.get<T>();
  }
}

class BFastUIStateBinder<T> extends Bind<T> {
  BFastUIStateBinder(T Function(Inject i) inject,
      {bool singleton = true, bool lazy = true})
      : super(inject, singleton: singleton, lazy: lazy);
}
