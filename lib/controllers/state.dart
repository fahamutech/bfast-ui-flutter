import 'package:bfastui/adapters/state.dart';
import 'package:flutter_modular/flutter_modular.dart';

assetStateType(var T) {
  assert(
  T.toString() != 'BFastUIState',
  "please tell us the implementation of BFastUIState."
      " For example *<your implementation here>()");
}

T getState<T extends StateAdapter>() {
  assetStateType(T);
  return Modular.get<T>();
}
