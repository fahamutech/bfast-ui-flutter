import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';

abstract class BFastUIService extends ChangeNotifier {
  String name;
  bool singleton;
  bool lazy;
  Function(Inject<dynamic> i) inject;
  BFastUIService(this.name);
}
