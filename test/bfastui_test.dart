import 'package:bfastui/adapters/state.dart';
import 'package:bfastui/bfastui.dart';
import 'package:bfastui/controllers/state.dart';
import 'package:flutter_test/flutter_test.dart';

class HomePageState extends BFastUIState {
  int age = 20;

  void incrementAge() {
    age++;
    notifyListeners();
  }
}

void main() {
  test('adds one to input values', () {
    BFastUI.states().addState<HomePageState>(
        BFastUIStateBinder((_) => HomePageState(), "home"));
    var binds = (BFastUI.states().getAll() != null)
        ? BFastUI.states().getAll()
        : [];
    print(binds);
    var state = BFastUI.states().getStateByName<HomePageState>("home");
    state.incrementAge();
    print(state.age);
  });
}
