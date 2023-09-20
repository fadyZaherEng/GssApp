import 'package:gss/src/di/injector.dart';
import 'package:gss/src/presentation/blocs/home/home_bloc.dart';
import 'package:gss/src/presentation/blocs/sign_in/sign_in_bloc.dart';
import 'package:gss/src/presentation/blocs/sign_up/sign_up_bloc.dart';

Future<void> blocInjection() async {
  instance.registerLazySingleton<HomeBloc>(() =>HomeBloc());
  instance.registerLazySingleton<SignInBloc>(() =>SignInBloc());
  instance.registerLazySingleton<SignUpBloc>(() =>SignUpBloc());

}
