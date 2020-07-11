import 'package:flutter/foundation.dart';

abstract class BFastUIService extends ChangeNotifier {
  // ignore: non_constant_identifier_names
  String _service__name_;
  bool singleton;
  bool lazy;

  BFastUIService(this._service__name_,
      {this.singleton = true, this.lazy = true});

  String get serviceName => this._service__name_;
}
