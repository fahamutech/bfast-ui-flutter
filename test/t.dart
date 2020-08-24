import 'package:bfastui/adapters/module.dart';
import 'package:bfastui/adapters/page.dart';
import 'package:bfastui/adapters/router.dart';
import 'package:bfastui/adapters/state.dart';
import 'package:bfastui/bfastui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';


class MyHomePage extends BFastUIPage{
  @override
  Widget build(args) {
    return Scaffold(
      body: Container(
        color: Colors.red,
      ),
    );
  }

}

class MyState extends BFastUIState{
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

class MyAppModule extends BFastUIMainModule{
  @override
  void initRoutes(String moduleName) {
      BFastUI
      .navigation(moduleName: moduleName)
      .addRoute(BFastUIRouter('/home', page: (content,args)=>MyHomePage()));

      BFastUI
      .navigation(moduleName: moduleName)
      .addRoute(BFastUIRouter('/secound', page: (content,args)=>MyHomePage()));
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
    BFastUI.module(MyAppModule()).start(
      initialPath: '/home'
    )
  );
}
