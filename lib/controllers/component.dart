import 'package:bfastui/adapters/state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BFastUIComponentController {
  Consumer<T> consumer<T extends BFastUIState>(
      final Widget Function(BuildContext context, T state) consumerBuilder) {
    assert(T.toString() != 'BFastUIState',
    "please tell us the implementation of BFastUIState. For example consumer<your implementation here>()");
    return Consumer<T>(
        builder: (context, state) => consumerBuilder(context, state));
  }

  Widget custom(Widget Function(BuildContext context) builder) {
    return Builder(builder: (context) => builder(context));
  }
}
