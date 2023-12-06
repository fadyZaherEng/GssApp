import 'package:get_it/get_it.dart';
import 'package:gss/src/data/sources/local/cashe/sign_in_local_data_source.dart';
import 'package:gss/src/di/bloc_injector.dart';
import 'package:gss/src/di/data_layer_injector.dart';
import 'package:gss/src/di/repository_injector.dart';
import 'package:gss/src/di/use_case_injector.dart';

final instance = GetIt.instance;

Future<void> injectionApp() async {
  // local data source
  instance.registerLazySingleton<SignInLocalDataSource>(
      () => SignInLocalDataSourceImpl());
  await dataLayerInjection();
  await repositoryInjection();
  await useCaseInjection();
  await blocInjection();
}
