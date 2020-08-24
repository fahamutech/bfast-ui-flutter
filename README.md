# BFastUI - Introduction

State and architecture management library for flutter 

![BFast UI](bfastui.png)

## Module

You organised your domain in your application in modules. Module is a top level abstraction of your
application. 
    
### MainModule

This is the bootstrap module for your application. Is only defined once your application. You will required to implement `initRoutes` and `initStates` method

* initRoutes - You will add all routes of the pages your module will use

* initStates - You will add all states you will use in your module


```dart

import 'package:bfastui/adapters/module.dart';

class MyApp extends BFastUIMainModule{
  @override
  void initRoutes(String moduleName) {
      // TODO: implement initRoutes
    }
  
    @override
    void initStates(String moduleName) {
    // TODO: implement initStates
  }

}

```
    
### ChildModule

This is the feature module to enclose your specific business logic. Your will required to impelement the following methods

* initRoutes - You will add all routes of the pages your module will use

* initStates - You will add all states you will use in your module

* moduleName - This will return your module name, name can be any `String` of your choice


```dart
import 'package:bfastui/adapters/module.dart';

class MyApp extends BFastUIChildModule{
  @override
  void initRoutes(String moduleName) {
      // TODO: implement initRoutes
    }
  
    @override
    void initStates(String moduleName) {
    // TODO: implement initStates
  }

  @override
  String moduleName() {
    // TODO: implement moduleName
    return 'your-module-name';
  }

}
```


## Page

Page is what your see presented by your mobile phone. i.e  login page. Page belongs to a specific module and characterised with `url` to navigate to. Page can have one or more components which make the whole page functional. To create a page you extend `BFastUIPage` and you will required to implement `build` method which return a `Widget` represent that page.

* build(var args) - your must provide implementation for this method. `args` parameter your will use it to extract information of that page i.e url parameters. `args` has the following properties

    ```dart
    final Map<String, dynamic> params;
    final dynamic data;  
    ```


```dart
import 'package:bfastui/adapters/page.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyPage extends BFastUIPage{
  @override
  Widget build(var args) {
    // TODO: implement build
    throw UnimplementedError();
  }

}
```

## State

State call information of the current view of your page ( s ). State is a `ChangeNotifier` class to be used with provider state management under the hood.

```dart
class MyState extends BFastUIState{
  
}
```

to notify listerner for changes your will just call `notifyListeners()` as you would in `ChangeNotifier` class.

## Route

A Route carry information of where to navigate to in your application and whether to allow someone access or not. You can navigate to another Page or Module. 



### Route Guard

To create a route guard

```dart
import 'package:bfastui/adapters/router.dart';
import 'package:bfastui/adapters/state.dart';

class MyRouteAuthGuard extends BFastUIRouterGuard{
  @override
  Future<bool> canActivate(String url) {
    // TODO: implement canActivate
    throw UnimplementedError();
  }
}
```

when `canActivate` resolve to `true` the page or a module someone navigate to will be activated otherwise will return to previous route if available


# BFastUI - How To Use It

## Installation

Open your project's `pubspec.yaml` and add `bfastui` as a dependency:

```yaml
dependencies:
  bfastui: any
```

You can also provide the git repository as source instead, to try out the newest features and fixes:

```yaml
dependencies:
  bfastui:
    git:
      url: https://github.com/fahamutech/bfast-ui-flutter.git
```

## Use only MainModule

```dart
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
      BFastUI.navigation(moduleName: moduleName)
      .addRoute(BFastUIRouter('/home', page: (content,args)=>MyHomePage()));

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

```

