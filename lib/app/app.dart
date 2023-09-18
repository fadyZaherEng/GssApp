import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:gss/presentation/blocs/home/home_bloc.dart';
import 'package:gss/presentation/blocs/sign_in/sign_in_bloc.dart';
import 'package:gss/presentation/blocs/sign_in/sign_in_state.dart';
import 'package:gss/presentation/blocs/sign_up/sign_up_bloc.dart';
import 'package:gss/presentation/screens/sign_in/sign_in_screen.dart';
import 'package:gss/utils/light_theme.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
