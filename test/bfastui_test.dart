import 'package:bfastui/adapters/state.dart';
import 'package:bfastui/bfastui.dart';
import 'package:bfastui/config.dart';
import 'package:bfastui/controllers/state.dart';
import 'package:flutter_test/flutter_test.dart';

class HomePageState extends BFastUIState {
  int age = 20;

  void incrementAge() {
    age++;
    notifyListeners();
  }
}

class HomePageState1 extends BFastUIState {
  int age = 1;

  void incrementAge() {
    age++;
    notifyListeners();
  }
}

void main() {
  test('adds one to input values', () {
//    BFastUI.states(moduleName: BFastUIConfig.DEFAULT_MODULE)
//      //  .addState<HomePageState>(BFastUIStateBinder((_) => HomePageState()))
//        .addState<HomePageState1>(BFastUIStateBinder((_) => HomePageState1()));
//    var binds =
//        (BFastUI.states(moduleName: BFastUIConfig.DEFAULT_MODULE).getAll() !=
//                null)
//            ? BFastUI.states(moduleName: BFastUIConfig.DEFAULT_MODULE).getAll()
//            : [];
//   //  print(binds);
//    var state = BFastUI.states(moduleName: BFastUIConfig.DEFAULT_MODULE).get();
    // print(state);
    // state.incrementAge();
   // print(state.age);
  });
}
