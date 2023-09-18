import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:gss/data/data_source/sign_in_local_data_source.dart';
import 'package:gss/data/network/dio_factory.dart';
import 'package:gss/data/network/network_info.dart';
import 'package:gss/data/network/sign_in_service/login_service.dart';
import 'package:gss/data/repository_impl/sign_in_repository_impl.dart';
import 'package:gss/domain/repository/sign_in_repository.dart';
import 'package:gss/domain/usecase/sign_in_usecase.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  // network info
  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionChecker()));
  // dio factory
  instance.registerLazySingleton<DioFactory>(() => DioFactory());
  Dio dio = await instance<DioFactory>().getDio();
  //app service client
  instance.registerLazySingleton<SignInServiceClient>(
      () => SignInServiceClient(dio));
  // local data source
  instance.registerLazySingleton<SignInLocalDataSource>(
      () => SignInLocalDataSourceImpl());
  // repository
  instance.registerLazySingleton<SignInRepository>(() => SignInRepositoryImpl(
        signInServiceClient: instance<SignInServiceClient>(),
        networkInfo: instance<NetworkInfo>(),
        localDataSource: instance<SignInLocalDataSource>(),
      ));
  if (!GetIt.I.isRegistered<SignInUseCase>()) {
    instance.registerFactory<SignInUseCase>(() => SignInUseCase(instance()));
  }
}
