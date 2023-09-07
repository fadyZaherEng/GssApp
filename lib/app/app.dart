import 'package:flutter/material.dart';
import 'package:gss/presentation/modules/home/cubit/bloc.dart';
import 'package:gss/presentation/modules/home/cubit/states.dart';
import 'package:gss/presentation/modules/sign_in/bloc/bloc.dart';
import 'package:gss/presentation/modules/sign_in/sign_in.dart';
import 'package:gss/presentation/modules/sign_up/bloc/bloc.dart';
import 'package:gss/presentation/modules/sign_up/sign_up.dart';
import 'package:gss/presentation/resources/theme_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sizer/sizer.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  initHomeUseCase() async {
    //await initHomeModule();
  }

  @override
  void initState() {
    super.initState();
    initHomeUseCase();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>AppBloc()),
        BlocProvider(create: (context)=>RegisterBloc()),
        BlocProvider(create: (context)=>LogInBloc()),
      ],
      child: BlocConsumer<AppBloc,AppStates>(
        listener: (context,state){},
        builder: (context,state){
          return  Sizer(builder: (ctx, orentation, deviceType) {
            return MaterialApp(
              home: const SignInScreen(),
              debugShowCheckedModeBanner: false,
              theme: lightTheme(),
            );
          });
        },
      ),
    );
  }
}
