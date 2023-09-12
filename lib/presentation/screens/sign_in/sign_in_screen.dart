// ignore_for_file: must_be_immutable, deprecated_member_use, avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gss/presentation/blocs/sign_in/sign_in_bloc.dart';
import 'package:gss/presentation/blocs/sign_in/sign_in_event.dart';
import 'package:gss/presentation/blocs/sign_in/sign_in_state.dart';
import 'package:gss/presentation/screens/home/home_screen.dart';
import 'package:gss/presentation/screens/sign_in/widgets/sign_in_body_widget.dart';
import 'package:gss/presentation/screens/sign_up/sign_up_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  String? _validationMessagePhone;
  String? _validationMessagePassword;
  final _formKey = GlobalKey<FormState>();

  SignInBloc get _bloc => BlocProvider.of<SignInBloc>(context);
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _bloc.add(SignInValidatePhoneNumberEvent(validatePhoneNumber: " "));
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInBloc, AbstractionSignInState>(
      listener: (context, state) {
        if (state is SignInValidatePhoneNumberState) {
          _validationMessagePhone = state.validationMassage;
        }
        if(state is SignInChangePasswordStates){
          _validationMessagePassword=state.validationMassage;
        }
        if(state is SignInNavigateToHomeScreenState){
          _validationMessagePassword=state.signInValidationModel.validationMassagePassword;
          _validationMessagePhone=state.signInValidationModel.validationMassagePhoneNumber;
        }
      },
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: SignInBodyWidget(
              formKey: _formKey,
              onChangePhoneNumber: (value) {
                _bloc.add(SignInValidatePhoneNumberEvent(validatePhoneNumber: value));
              },
              passwordController: _passwordController,
              phoneController: _phoneController,
              onSubmittedPhoneNumber: (String value) {
                _bloc.add(SignInSubmittedPhoneNumberEvent(signInPhoneNumber: value));
              },
              validationMessagePassword: _validationMessagePassword,
              validationMessagePhone: _validationMessagePhone,
              onChangePassword: (String value) {
                _bloc.add(SignInChangePasswordEvent(signInPassword: value));
              },
              onPressedClosed: () {
                _bloc.add(SignInPressedClosedEvent());
              },
              onPressedForgetPassword: () {
                _bloc.add(SignInPressedForgetPasswordEvent(
                    signInPhoneNumber: _phoneController.text));
              },
              navigateToHomeScreen: () {
                _bloc.add(
                  SignInNavigateToHomeScreenEvent(
                    context: context,
                    screen: const MyHomePage(),
                    validate: _formKey.currentState!.validate(),
                    phone: _phoneController.text,
                    password: _passwordController.text
                  ),
                );
              },
              navigateToSignUpScreen: () {
                _bloc.add(
                  SignInNavigateToSignUpScreenEvent(
                    context: context,
                    screen:  const SignUpScreen(),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
