import 'package:get_it/get_it.dart';
import 'package:hiragana_japanesse/di/dependency_injector.config.dart';
import 'package:injectable/injectable.dart';

final sl = GetIt.instance;

@InjectableInit(asExtension: true)
Future<void> configureDependencies(String environment) async {
  sl.init(environment: environment);
}

// flutter packages pub run build_runner watch