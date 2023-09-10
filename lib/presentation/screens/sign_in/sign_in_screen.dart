// ignore_for_file: must_be_immutable, deprecated_member_use, avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gss/presentation/blocs/sign_in/sign_in_bloc.dart';
import 'package:gss/presentation/blocs/sign_in/sign_in_events.dart';
import 'package:gss/presentation/blocs/sign_in/sign_in_states.dart';
import 'package:gss/presentation/screens/sign_in/widgets/sign_in_background_widget.dart';
import 'package:gss/presentation/screens/sign_in/widgets/sign_in_body_widget.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  String? validationMessage;

  final _formKey = GlobalKey<FormState>();

  LogInBloc get _bloc => BlocProvider.of<LogInBloc>(context);

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LogInBloc, LogInStates>(
      listener: (context, state) {
        if (state is ValidatePhoneLoginStates) {
          validationMessage = state.res;
        }
      },
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Stack(
              children: [
                const SignInBackgroundWidget(),
                SignInBodyWidget(
                    validationMessage: validationMessage,
                    formKey: _formKey,
                    onChangePhoneNumber: (val) {
                      _bloc.add(ValidatePhoneEventsSignIn(val: val ?? ""));
                    },
                    passwordController: _passwordController,
                    phoneController: _phoneController),
              ],
            ),
          ),
        );
      },
    );
  }
}
