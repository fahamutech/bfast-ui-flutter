import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

class DependencyInjectionController {
  final getIt = GetIt.instance;

  // @InjectableInit(
  //   initializerName: r'$initGetIt', // default
  //   preferRelativeImports: true, // default
  //   asExtension: false, // default
  // )
  // static void configureDependencies() => $initGetIt(getIt);
}
