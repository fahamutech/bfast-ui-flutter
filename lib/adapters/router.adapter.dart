import 'package:bfastui/adapters/page.adapter.dart';
import 'package:bfastui/adapters/router-guard.adapter.dart';
import 'package:bfastui/controllers/child-module.controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RouterAdapter {
  final String routerName;
  final PageAdapter Function(BuildContext context, dynamic args) page;
  final ChildModuleController module;
  final List<RouterGuardAdapter> guards;
  final TransitionType transition;
  final CustomTransition customTransition;
  final Widget onGuardCheck;

  RouterAdapter(
    this.routerName, {
    this.module,
    this.page,
    this.guards,
    this.onGuardCheck,
    this.transition = TransitionType.defaultTransition,
    this.customTransition,
  });

  String get navigationName => module.module.toString();
}
