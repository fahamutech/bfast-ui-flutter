import 'package:bfastui/adapters/service.dart';
import 'package:flutter/widgets.dart';

abstract class ComponentAdapter {
  custom(Widget widget);

  consumer<T extends StateAdapter>(
      final Widget Function(BuildContext context, T value) builder);
}
