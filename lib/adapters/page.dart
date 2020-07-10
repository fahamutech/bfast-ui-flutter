import 'package:flutter/material.dart';

abstract class PageAdapter {
  Widget widget;
  Scaffold scaffold(Scaffold scaffold);

  Widget custom(Widget widget);
}
