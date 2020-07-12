import 'package:bfastui/adapters/component.dart';
import 'package:bfastui/adapters/state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BFastUIComponentController extends BFastUIComponent {
  @override
  consumer<T extends BFastUIState>(
      final Widget Function(BuildContext context, T state) builder) {
    assert(T != null && T.runtimeType.toString() != "BFastUIState");
    return Consumer<T>(
      builder: builder,
    );
  }

  @override
  custom(Widget widget) {
    return widget;
  }
}
