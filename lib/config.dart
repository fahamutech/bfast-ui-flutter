class BFastUIConfig {
  static const String DEFAULT_MODULE = '_DEFAULT_MODULE_';
  static final BFastUIConfig _instance = BFastUIConfig._();

  factory BFastUIConfig.getInstance() {
    return BFastUIConfig._instance;
  }

  BFastUIConfig._();
}
