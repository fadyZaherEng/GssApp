import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:gss/data/data_source/local_data_source.dart';
import 'package:gss/data/data_source/remote_data_source.dart';
import 'package:gss/data/network/app_api.dart';
import 'package:gss/data/network/dio_factory.dart';
import 'package:gss/data/network/network_info.dart';
import 'package:gss/data/repository/repository_impl.dart';
import 'package:gss/domain/repository/repository.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  // network info
  instance.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(InternetConnectionChecker()));
  // dio factory
  instance.registerLazySingleton<DioFactory>(() => DioFactory());
  Dio dio = await instance<DioFactory>().getDio();
  //app service client
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));
  // remote data source
  instance.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl(instance<AppServiceClient>()));
  // local data source
  instance.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl());
  // repository
  instance.registerLazySingleton<Repository>(() => RepositoryImpl(instance(), instance(),instance()));
}
// initHomeModule() {
//   if (!GetIt.I.isRegistered<HomeUseCase>()) {
//     instance.registerFactory<HomeUseCase>(() => HomeUseCase(instance()));
//   }
// }

