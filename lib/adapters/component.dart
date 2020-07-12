import 'package:bfastui/adapters/state.dart';
import 'package:flutter/widgets.dart';

abstract class BFastUIComponent {
  custom(Widget widget);

  consumer<T extends BFastUIState>(
      final Widget Function(BuildContext context, T value) builder);
}
