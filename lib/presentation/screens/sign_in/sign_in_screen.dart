// ignore_for_file: must_be_immutable, deprecated_member_use, avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gss/presentation/blocs/sign_in/sign_in_bloc.dart';
import 'package:gss/presentation/blocs/sign_in/sign_in_states.dart';
import 'package:gss/presentation/screens/sign_in/widgets/sign_in_background.dart';
import 'package:gss/presentation/screens/sign_in/widgets/sign_in_body.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LogInBloc, LogInStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Stack(
              children: [
                const SignInBackground(),

                ///Remove state here
                SignInBody(state),
              ],
            ),
          ),
        );
      },
    );
  }
}
