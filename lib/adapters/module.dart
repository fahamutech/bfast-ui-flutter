import 'package:bfastui/config.dart';

abstract class _BFastUIModule {
  void initStates(String moduleName);

  String moduleName();

  void initRoutes(String moduleName);
}

abstract class BFastUIMainModule extends _BFastUIModule {
  @override
  String moduleName() {
    return BFastUIConfig.DEFAULT_MODULE;
  }
}

abstract class BFastUIChildModule extends _BFastUIModule {}
