import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gss/presentation/blocs/home/app_bloc.dart';
import 'package:gss/presentation/blocs/home/home_states.dart';
import 'package:gss/presentation/blocs/sign_in/sign_in_bloc.dart';
import 'package:gss/presentation/blocs/sign_up/register_bloc.dart';
import 'package:gss/presentation/screens/sign_in/sign_in_screen.dart';
import 'package:gss/utils/light_theme.dart';

import 'package:sizer/sizer.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>AppBloc()),
        BlocProvider(create: (context)=>RegisterBloc()),
        BlocProvider(create: (context)=>SignInBloc()),
      ],
      child: BlocConsumer<AppBloc,AppStates>(
        listener: (context,state){},
        builder: (context,state){
          return  Sizer(builder: (ctx, orentation, deviceType) {
            return MaterialApp(
              home:  SignInScreen(),
              debugShowCheckedModeBanner: false,
              theme: lightTheme(),
            );
          });
        },
      ),
    );
  }
}
