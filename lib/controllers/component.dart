import 'package:bfastui/adapters/component.dart';
import 'package:bfastui/adapters/service.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BFastUIComponentController extends BFastUIComponent {
  @override
  consumer<T extends BFastUIService>(
      final Widget Function(BuildContext context, T state) builder) {
    return Consumer<T>(
      builder: builder,
    );
  }

  @override
  custom(Widget widget) {
    return widget;
  }
}

//abstract class BFastUIConsumer<T> extends Widget {
//  build(T model);
//}
