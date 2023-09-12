import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gss/presentation/blocs/home/home_bloc.dart';
import 'package:gss/presentation/blocs/home/home_state.dart';
import 'package:gss/presentation/blocs/sign_in/sign_in_bloc.dart';
import 'package:gss/presentation/blocs/sign_up/sign_up_bloc.dart';
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
        BlocProvider(create: (context)=>HomeBloc()),
        BlocProvider(create: (context)=>SignUpBloc()),
        BlocProvider(create: (context)=>SignInBloc()),
      ],
      child: BlocConsumer<HomeBloc,AbstractionHomeState>(
        listener: (context,state){},
        builder: (context,state){
          return  Sizer(builder: (ctx, orentation, deviceType) {
            return MaterialApp(
              home:  const SignInScreen(),
              debugShowCheckedModeBanner: false,
              theme: lightTheme(),
            );
          });
        },
      ),
    );
  }
}
