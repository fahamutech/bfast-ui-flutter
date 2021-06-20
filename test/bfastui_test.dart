// import 'package:bfastui/adapters/state.adapter.dart';
// import 'package:bfastui/bfastui.dart';
// import 'package:bfastui/config.dart';
// import 'package:bfastui/controllers/state.controller.dart';
// import 'package:flutter_test/flutter_test.dart';
//
// class HomePageState extends StateAdapter {
//   int age = 20;
//
//   void incrementAge() {
//     age++;
//     notifyListeners();
//   }
// }
//
// class HomePageState1 extends StateAdapter {
//   int age = 1;
//
//   void incrementAge() {
//     age++;
//     notifyListeners();
//   }
// }
//
// void main() {
//   test('adds one to input values', () {
// //    BFastUI.states(moduleName: BFastUIConfig.DEFAULT_MODULE)
// //      //  .addState<HomePageState>(BFastUIStateBinder((_) => HomePageState()))
// //        .addState<HomePageState1>(BFastUIStateBinder((_) => HomePageState1()));
// //    var binds =
// //        (BFastUI.states(moduleName: BFastUIConfig.DEFAULT_MODULE).getAll() !=
// //                null)
// //            ? BFastUI.states(moduleName: BFastUIConfig.DEFAULT_MODULE).getAll()
// //            : [];
// //   //  print(binds);
// //    var state = BFastUI.states(moduleName: BFastUIConfig.DEFAULT_MODULE).get();
//     // print(state);
//     // state.incrementAge();
//    // print(state.age);
//   });
// }

import 'package:bfastui/adapters/main-module.adapter.dart';
import 'package:bfastui/adapters/page.adapter.dart';
import 'package:bfastui/adapters/router.adapter.dart';
import 'package:bfastui/adapters/state.adapter.dart';
import 'package:bfastui/bfastui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';


class MyHomePage extends PageAdapter{
  @override
  Widget build(args) {
    return Scaffold(
      body: Container(
        color: Colors.red,
      ),
    );
  }

}

class MyState extends StateAdapter{
  int count = 0;

  increase(){
    count += 1;
    notifyListeners();
  }
  decrement(){
    count -= 1;
    notifyListeners();
  }
}

class MyAppModule extends MainModuleAdapter{
  @override
  void initRoutes(String moduleName) {
    BFastUI.navigation(moduleName: moduleName)
        .addRoute(RouterAdapter('/home', page: (content,args)=>MyHomePage()));

  }

  @override
  void initStates(String moduleName) {
    BFastUI
        .states(moduleName: moduleName)
        .addState((i) => MyState());
  }

}


void main(){
  runApp(
      BFastUI.init(module: MyAppModule(), component: MaterialApp(
          initialRoute: '/home',
      )).start()
  );
}
