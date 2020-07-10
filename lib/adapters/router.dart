import 'package:bfastui/adapters/page.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';

abstract class RouterAdapter {
  final String routerName;
  final PageAdapter Function(BuildContext context, ModularArguments args) page;
  final ChildModule module;
  Map<String, String> params;
  final List<RouteGuard> guards;
  final TransitionType transition;
  final CustomTransition customTransition;
  final String modulePath;
  final Future<bool> Function(BuildContext context) before;

  RouterAdapter(
    this.routerName, {
    this.module,
    this.page,
    this.before,
    this.guards,
    this.params,
    this.transition = TransitionType.defaultTransition,
    this.customTransition,
    this.modulePath,
  });
}

//class RouterArgs {
//  final Map<String, dynamic> params;
//  final dynamic data;
//
//  RouterArgs(this.params, this.data);
//
//  RouterArgs copy() {
//    return RouterArgs(params, data);
//  }
//}
