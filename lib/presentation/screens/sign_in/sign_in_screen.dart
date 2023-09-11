// ignore_for_file: must_be_immutable, deprecated_member_use, avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gss/presentation/blocs/sign_in/sign_in_bloc.dart';
import 'package:gss/presentation/blocs/sign_in/sign_in_event.dart';
import 'package:gss/presentation/blocs/sign_in/sign_in_state.dart';
import 'package:gss/presentation/screens/home/home_screen.dart';
import 'package:gss/presentation/screens/sign_in/widgets/sign_in_body_widget.dart';
import 'package:gss/presentation/screens/sign_up/sign_up_screen.dart';
import 'package:gss/utils/navigate_with_return.dart';
import 'package:gss/utils/navigate_without_return.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  String? _validationMessage;
  final _formKey = GlobalKey<FormState>();

  SignInBloc get _bloc => BlocProvider.of<SignInBloc>(context);
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInBloc, SignInState>(
      listener: (context, state) {
        if (state is SignInValidatePhoneNumberState) {
          _validationMessage = state.validationMassage;
        }
      },
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: SignInBodyWidget(
              formKey: _formKey,
              onChangePhoneNumber: (value) {
                _bloc.add(
                    SignInValidatePhoneNumberEvent(validatePhoneNumber: value));
              },
              passwordController: _passwordController,
              phoneController: _phoneController,
              onSubmittedPhoneNumber: (val) {},
              validationMessage: _validationMessage,
              onChangePassword: (String value) {},
              onPressedClosed: () {},
              onPressedForgetPassword: () {},
              navigateToHomeScreen: () {
                navigateToWithoutReturn(
                  context: context,
                  screen: const MyHomePage(),
                  validate: _formKey.currentState!.validate(),
                );
              },
              navigateToSignUpScreen: () {
                navigateToWithReturn(
                  context: context,
                  screen: SignUpScreen(),
                  validate: _formKey.currentState!.validate(),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
