// ignore_for_file: must_be_immutable, deprecated_member_use, avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gss/presentation/blocs/sign_up/sign_up_bloc.dart';
import 'package:gss/presentation/blocs/sign_up/sign_up_states.dart';
import 'package:gss/presentation/screens/sign_up/widgets/sign_up_background.dart';
import 'package:gss/presentation/screens/sign_up/widgets/sign_up_body.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  String? _res;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterBloc, RegisterStates>(
      listener: (context, state) {
        if(state is ValidatePhoneStates){
          _res=state.res;
        }
      },
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Stack(
              children: [
                const SignUpBackground(),
                SignUpBody(res:_res),
              ],
            ),
          ),
        );
      },
    );
  }
}
