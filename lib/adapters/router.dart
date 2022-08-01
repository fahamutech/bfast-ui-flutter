import 'package:bfastui/adapters/child_module.dart';
import 'package:bfastui/adapters/page.dart';
import 'package:bfastui/adapters/router_guard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RouterAdapter {
  final String routerName;
  final PageAdapter Function(BuildContext context, dynamic args)? page;
  final ChildModuleAdapter? module;
  final List<RouterGuardAdapter> guards;
  final TransitionType transition;
  final CustomTransition? customTransition;
  final Widget? onGuardCheck;

  RouterAdapter(
    this.routerName, {
    this.module,
    this.page,
    this.guards = const [],
    this.onGuardCheck,
    this.transition = TransitionType.defaultTransition,
    this.customTransition,
  });

  String get navigationName => module?.moduleName() ?? 'un_named_module';
}
