// ignore_for_file: must_be_immutable, deprecated_member_use, avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gss/presentation/blocs/sign_up/sign_up_bloc.dart';
import 'package:gss/presentation/blocs/sign_up/sign_up_event.dart';
import 'package:gss/presentation/blocs/sign_up/sign_up_state.dart';
import 'package:gss/presentation/screens/home/home_screen.dart';
import 'package:gss/presentation/screens/sign_in/sign_in_screen.dart';
import 'package:gss/presentation/screens/sign_up/widgets/sign_up_body_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  SignUpBloc get _bloc => BlocProvider.of<SignUpBloc>(context);
  //massage
  String? _validationMassageFullName;
  String? _validationMassagePhoneNumber;
  String? _validationMassageEmail;
  String? _validationMassagePassword;
  //controller
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpBloc, AbstractionSignUpState>(
      listener: (context, state) {
        if (state is SignUpValidatePhoneNumberState) {
          _validationMassagePhoneNumber = state.validationMassage;
        }
        if (state is SignUpValidateFullNameState) {
          _validationMassageFullName = state.validationMassage;
        }
        if (state is SignUpChangedEmailState) {
          _validationMassageEmail = state.validateMassage;
        }
        if (state is SignUpChangedPasswordState) {
          _validationMassagePassword = state.validateMassage;
        }
        if(state is SignUpNavigateToHomeScreenState){
          _validationMassagePassword=state.validationModel.validationMassagePassword;
          _validationMassageEmail=state.validationModel.validationMassageEmail;
          _validationMassageFullName=state.validationModel.validationMassageFullName;
          _validationMassagePhoneNumber=state.validationModel.validationMassagePhoneNumber;
        }
      },
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: SignUpBodyWidget(
              validationMassageEmail: _validationMassageEmail,
              validationMassageFullName: _validationMassageFullName,
              validationMassagePassword: _validationMassagePassword,
              validationMassagePhoneNumber: _validationMassagePhoneNumber,
              phoneController: _phoneController,
              passwordController: _passwordController,
              onChangedPhoneNumber: (value) {
                _bloc.add(SignUpValidatePhoneEvents(signUpPhoneNumber: value));
              },
              emailController: _emailController,
              formKey: _formKey,
              nameController: _nameController,
              onSubmittedPhoneNumber: (value) {
                _bloc.add(SignUpSubmittedPhoneNumberEvents(signUpPhoneNumber: value));
              },
              onPressedChangedEmail: (value) {
                _bloc.add(SignUpChangedEmailEvents(signUpEmail: value));
              },
              onPressedChangedFullName: (value) {
                _bloc.add(SignUpChangedFullNameEvents(signUpFullName: value));
              },
              onPressedChangedPassword: (value) {
                _bloc.add(SignUpChangedPasswordEvents(signUpPassword: value));
              },
              onPressedSubmittedFullName: (value) {
                _bloc.add(SignUpSubmittedFullNameEvents(signUpFullName: value));
              },
              onPressesClosed: () {
                _bloc.add(SignUpPressedClosedEvent());
              },
              signUpOnPressed: () {
                _bloc.add(
                  SignUpEvents(
                    context: context,
                    screen: const MyHomePage(),
                    name: _nameController.text,
                    email: _emailController.text,
                    password: _passwordController.text,
                    phone: _phoneController.text,
                  ),
                );
              },
              onPressedAlreadyAccount: () {
                _bloc.add(
                  SignUpAlreadyHaveAccountEvent(
                    context: context,
                    screen: const SignInScreen(),
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
