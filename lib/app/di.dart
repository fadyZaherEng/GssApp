import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:gss/data/data_source/local_data_source.dart';
import 'package:gss/data/network/login_service.dart';
import 'package:gss/data/network/dio_factory.dart';
import 'package:gss/data/network/network_info.dart';
import 'package:gss/data/repository/repository_impl.dart';
import 'package:gss/domain/repository/repository.dart';
import 'package:gss/domain/usecase/login_usecase.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  // network info
  instance.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(InternetConnectionChecker()));
  // dio factory
  instance.registerLazySingleton<DioFactory>(() => DioFactory());
  Dio dio = await instance<DioFactory>().getDio();
  //app service client
  instance.registerLazySingleton<LogInServiceClient>(() =>LogInServiceClient(dio));
  // local data source
  instance.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl());
  // repository
  instance.registerLazySingleton<Repository>(() =>
      RepositoryImpl(instance<LogInServiceClient>(), instance<NetworkInfo>(),instance<LocalDataSource>()));
  if (!GetIt.I.isRegistered<LogInUseCase>()) {
    instance.registerFactory<LogInUseCase>(() => LogInUseCase(instance()));
  }
}


