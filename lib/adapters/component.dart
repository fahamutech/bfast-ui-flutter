import 'package:bfastui/adapters/service.dart';
import 'package:flutter/widgets.dart';

abstract class BFastUIComponent {
  custom(Widget widget);

  consumer<T extends BFastUIService>(
      final Widget Function(BuildContext context, T value) builder);
}
