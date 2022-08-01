import 'package:bfastui/adapters/state.dart';
import 'package:bfastui/controllers/state.dart';
import 'package:builders/builders.dart';
import 'package:flutter/widgets.dart';

Consumer<T> consumerComponent<T extends StateAdapter>({
  required Widget Function(BuildContext context, T? state) builder,
}) {
  assetStateType(T);
  return Consumer<T>(builder: builder);
}

Selector<T, D> selectorComponent<T extends StateAdapter, D>({
  required D Function(T? state) selector,
  required Widget Function(BuildContext context, D? value) builder,
}) {
  assetStateType(T);
  return Selector<T, D>(selector: selector, builder: builder);
}
