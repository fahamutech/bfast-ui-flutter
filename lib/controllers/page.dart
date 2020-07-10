import 'package:bfastui/adapters/page.dart';
import 'package:flutter/material.dart';

class PageController extends PageAdapter {
  Widget widget;
  String moduleName;

  PageController(this.moduleName);

  @override
  Scaffold scaffold(Scaffold widget) {
    this.widget = widget;
    return this.widget;
  }

  @override
  Widget custom(Widget widget) {
    this.widget = widget;
    return this.widget;
  }
}
