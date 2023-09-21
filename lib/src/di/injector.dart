import 'package:get_it/get_it.dart';
import 'package:gss/src/data/sources/local/cashe/sign_in_local_data_source.dart';

final instance = GetIt.instance;

Future<void> injectionApp() async {
  // local data source
  instance.registerLazySingleton<SignInLocalDataSource>(() => SignInLocalDataSourceImpl());
}
