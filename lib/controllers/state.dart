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

  static final Map<String, Map<String, Bind>> _states = {};

  BFastUIStateController addState<T extends BFastUIState>(
    T Function(Inject i) inject, {
    bool singleton = true,
    bool lazy = true,
  }) {
    assert(T.toString() != 'BFastUIState',
        "please tell us the implementation of BFastUIState. For example addState<your implementation here>(...)");
    if (_states.containsKey(_moduleName)) {
      _states[_moduleName].update(T.toString(),
          (_) => Bind<T>((_)=>inject(_), lazy: lazy, singleton: singleton),
          ifAbsent: () => Bind<T>((_)=>inject(_), lazy: lazy, singleton: singleton));
    } else {
      Map<String, Bind> map = Map();
      map.update(T.toString(),
          (_) => Bind<T>((_)=>inject(_), lazy: lazy, singleton: singleton),
          ifAbsent: () => Bind<T>((_)=>inject(_), lazy: lazy, singleton: singleton));
      _states[_moduleName] = map;
    }
    return this;
  }

  List<Bind> getAll() {
    return _states[_moduleName] != null
        ? _states[_moduleName].values.toList()
        : [];
  }

  T get<T extends BFastUIState>() {
    assert(T.toString() != 'BFastUIState',
        "please tell us the implementation of BFastUIState. For example get<your implementation here>()");
    return Modular.get<T>();
  }
}

class BFastUIStateBinder<T extends BFastUIState> {
  T Function(Inject i) inject;
  bool singleton;
  bool lazy;

  BFastUIStateBinder(this.inject, {this.singleton = true, this.lazy = true})
  // : super(inject, singleton: singleton, lazy: lazy)
  {
    assert(T.toString() != 'BFastUIState',
        "please return the implementation of BFastUIState in inject Function and not the otherwise");
  }

  String get stateName => T.toString();
}
