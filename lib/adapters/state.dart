import 'package:flutter/foundation.dart';

abstract class StateAdapter extends ChangeNotifier {
  void onDispose();
}
