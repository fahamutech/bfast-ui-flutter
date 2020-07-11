import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';

abstract class BFastUIService extends ChangeNotifier {
  String _name;
  bool singleton;
  bool lazy;
  Function(Inject<dynamic> i) inject;

  BFastUIService(this._name, {this.singleton, this.lazy, this.inject});

  String get serviceName => this._name;
}
