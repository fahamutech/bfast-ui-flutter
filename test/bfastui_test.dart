import 'package:bfastui/adapters/main_module.dart';
import 'package:bfastui/adapters/page.dart';
import 'package:bfastui/adapters/router.dart';
import 'package:bfastui/adapters/state.dart';
import 'package:bfastui/controllers/component.dart';
import 'package:bfastui/controllers/module.dart';
import 'package:flutter/material.dart';

class MyHomePage extends PageAdapter {
  @override
  Widget build(args) {
    return Scaffold(
      body: Container(
        color: Colors.red,
        child: Column(
          children: [
            consumerComponent<MyState>(
              builder: (c, state) => Text('${state?.count}'),
            ),
            selectorComponent<MyState, int>(
              selector: (s) => s?.count ?? 0,
              builder: (c, data) => Text('$data'),
            )
          ],
        ),
      ),
    );
  }
}

class MyState extends StateAdapter {
  int count = 0;

  increase() {
    count += 1;
    notifyListeners();
  }

  decrement() {
    count -= 1;
    notifyListeners();
  }

  @override
  void onDispose() {}
}

class MyAppModule extends MainModuleAdapter {
  @override
  List<RouterAdapter> initRoutes(String moduleName) => [
        RouterAdapter('/home', page: (c, _) => MyHomePage()),
      ];

  @override
  List<StateAdapter> initStates(String moduleName) => [
        MyState(),
      ];
}

void main() {
  runApp(
    bfastUiApp(
      module: MyAppModule(),
      component: MaterialApp(
        initialRoute: '/home',
      ),
    ),
  );
}
