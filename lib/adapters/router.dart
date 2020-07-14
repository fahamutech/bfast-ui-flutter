import 'package:bfastui/adapters/module.dart';
import 'package:bfastui/adapters/page.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BFastUIRouter {
  final String routerName;
  final BFastUIPage Function(BuildContext context, ModularArguments args) page;
  final BFastUIChildModule module;
  Map<String, String> params;
  final List<BFastUIRouterGuard> guards;
  final TransitionType transition;
  final CustomTransition customTransition;
  final String modulePath;
  final Future<bool> Function(BuildContext context) before;

  BFastUIRouter(
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

abstract class BFastUIRouterGuard {
  Future<bool> canActivate(String url);
}
