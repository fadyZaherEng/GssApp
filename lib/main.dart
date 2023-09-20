// ignore_for_file: avoid_print
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:gss/src/config/themes/light_theme.dart';
import 'package:gss/src/core/resources/firebase_options.dart';
import 'package:gss/src/data/repositories/local_repositories/cashe_helper.dart';
import 'package:gss/src/data/sources/remote/gbu/notification/local_notification.dart';
import 'package:gss/src/di/data_layer_injector.dart';
import 'package:gss/src/di/injector.dart';
import 'package:gss/src/di/use_case_injector.dart';
import 'package:gss/src/di/repository_injector.dart';
import 'package:gss/src/domain/entities/responses/home_response/home_tower.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:gss/src/presentation/blocs/home/home_bloc.dart';
import 'package:gss/src/presentation/blocs/sign_in/sign_in_bloc.dart';
import 'package:gss/src/presentation/blocs/sign_in/sign_in_state.dart';
import 'package:gss/src/presentation/blocs/sign_up/sign_up_bloc.dart';
import 'package:gss/src/presentation/screens/sign_in/sign_in_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

//mapper
//divide class response to header w body
//do file as picture architure
//@json serilizable and mapper in models
//convert app to di
//service w remote
//repo
//use case
//bloc
//router in article


Future<void> firebaseMassageBackground(RemoteMessage message) async {
  LocalNotificationService.display(message);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injectionApp();
  await dataLayerInjection();
  await repositoryInjection();
  await useCaseInjection();
  await LocalNotificationService.initialize();
  await SharedHelper.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final Directory dir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  Hive.registerAdapter(TowerModelAdapter());
  if (!Hive.isBoxOpen('towers')) {
    await Hive.openBox<TowerModel>('towers');
  }
  var token = await FirebaseMessaging.instance.getToken();
  print("token:$token \n");
  FirebaseMessaging.onMessageOpenedApp.listen((message) {
    LocalNotificationService.display(message);
  });
  FirebaseMessaging.onBackgroundMessage(firebaseMassageBackground);
  FirebaseMessaging.onMessage.listen((message) {
    LocalNotificationService.display(message);
  });
  if (SharedHelper.get(key: 'lang') == null) {
    SharedHelper.save(value: 'arabic', key: 'lang');
  }
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    Locale _locale=const Locale("en");
    return MultiBlocProvider(
      providers:
      [
        BlocProvider(create: (context)=>HomeBloc()),
        BlocProvider(create: (context)=>SignUpBloc()),
        BlocProvider(create: (context)=>SignInBloc()),
      ],
      child: BlocConsumer<SignInBloc,AbstractionSignInState>(
        listener: (context,state){
          if(state is SignInChangeLangState){
            _locale=state.locale;
          }
        },
        builder: (context,state){
          return  Phoenix(
            child: Sizer(builder: (ctx, orentation, deviceType) {
              return MaterialApp(
                //flutter gen-l10n
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                supportedLocales: AppLocalizations.supportedLocales,
                locale: _locale,
                home:  const SignInScreen(),
                debugShowCheckedModeBanner: false,
                theme: lightTheme(),
              );
            }),
          );
        },
      ),
    );
  }
}
