import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';

abstract class BFastUIService extends ChangeNotifier {
  // ignore: non_constant_identifier_names
  String _service__name_;
  bool singleton;
  bool lazy;
  final BFastUIService Function(Inject i) inject;

  BFastUIService(this._service__name_, this.inject,
      {this.singleton = true, this.lazy = true});

  String get serviceName => this._service__name_;
}
