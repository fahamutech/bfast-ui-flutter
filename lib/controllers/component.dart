import 'package:bfastui/adapters/state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BFastUIComponentController {
  Consumer<T> consumer<T extends BFastUIState>(
      final Widget Function(BuildContext context, T state) builder) {
    assert(T != null && T.runtimeType.toString() != "BFastUIState");
    return Consumer<T>(
      builder: builder,
    );
  }

  Widget custom(Widget Function(BuildContext context) builder) {
    return Builder(
      builder: (context) => builder(context),
    );
  }
}
