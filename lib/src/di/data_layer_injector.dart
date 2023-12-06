// ignore_for_file: constant_identifier_names

import 'package:dio/dio.dart';
import 'package:gss/src/core/utils/network/intercepotor.dart';
import 'package:gss/src/data/repositories/remote_repositories/network_info_impl.dart';
import 'package:gss/src/data/sources/remote/gbu/sign_in/login_service.dart';
import 'package:gss/src/di/injector.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

Future<void> dataLayerInjection() async {
  // network info
  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionChecker()));
  Dio dio = await getDio();
  //app service client
  instance.registerLazySingleton<SignInServiceClient>(
      () => SignInServiceClient(dio));
}
