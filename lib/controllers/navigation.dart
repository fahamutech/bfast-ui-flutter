import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';

navigateTo(String routeName) => WidgetsBinding.instance
    .addPostFrameCallback((_) => Modular.to.pushNamed(routeName));

navigateToAndReplace(String routeName) => WidgetsBinding.instance
    .addPostFrameCallback((_) => Modular.to.pushReplacementNamed(routeName));

IModularNavigator navigator() => Modular.to;
