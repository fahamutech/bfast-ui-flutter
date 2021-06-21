import 'package:bfastui/adapters/state.adapter.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../config.dart';

class StateController {
  static final StateController _instance = StateController._();
  static String _moduleName = BFastUIConfig.DEFAULT_MODULE;

  factory StateController.getInstance(
      [String moduleName = BFastUIConfig.DEFAULT_MODULE]) {
    _moduleName = moduleName;
    return _instance;
  }

  StateController._();

  static final Map<String, Map<String, Bind>> _states = {};

  StateController addState<T extends StateAdapter>(
    T Function(Inject i) state, {
    bool singleton = true,
    bool lazy = true,
  }) {
    assert(T.toString() != 'BFastUIState',
        "please tell us the implementation of BFastUIState. For example addState<your implementation here>(...)");
    if (_states.containsKey(_moduleName)) {
      _states[_moduleName].update(
        T.toString(),
        (_) => Bind.lazySingleton((_) => state(_)),
        ifAbsent: () => Bind.lazySingleton((_) => state(_)),
      );
    } else {
      Map<String, Bind> map = Map();
      map.update(
        T.toString(),
        (_) => Bind.lazySingleton((_) => state(_)),
        ifAbsent: () => Bind.lazySingleton((_) => state(_)),
      );
      _states[_moduleName] = map;
    }
    return this;
  }

  List<Bind> getAll() {
    return _states[_moduleName] != null
        ? _states[_moduleName].values.toList()
        : [];
  }

  T get<T extends StateAdapter>() {
    assert(T.toString() != 'BFastUIState',
        "please tell us the implementation of BFastUIState. For example get<your implementation here>()");
    return Modular.get<T>();
  }
}