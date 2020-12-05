import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

abstract class BFastDependencyInjectionController {
  final getIt = GetIt.instance;

  /**
   * Implement method and return $initGetIt(getIt)
   * run the commands 
   *  - flutter packages pub run build_runner watch
   * this will generate a file containing all annotations
   * 
   */
  @InjectableInit(
    initializerName: r'$initGetIt', // default
    preferRelativeImports: true, // default
    asExtension: false, // default
  )
  void configureDependencies();


}
