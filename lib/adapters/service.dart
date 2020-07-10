import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';

abstract class StateAdapter extends ChangeNotifier {
  String name;
  bool singleton;
  bool lazy;
  Function(Inject<dynamic> i) inject;
  StateAdapter(this.name);
}
