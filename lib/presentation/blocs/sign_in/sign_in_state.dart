import 'package:flutter/material.dart';

abstract class AbstractionSignInState {}

class SignInSubmittedPhoneNumberState extends AbstractionSignInState {}

class SignInPressedClosedState extends AbstractionSignInState {}

class SignInPressedForgetPasswordState extends AbstractionSignInState {
  String signInPassword;

  SignInPressedForgetPasswordState(this.signInPassword);
}

class SignInNavigateToHomeScreenState extends AbstractionSignInState {}

class SignInNavigateToSignUpScreenState extends AbstractionSignInState {}

class SignInChangePasswordStates extends AbstractionSignInState {
  String massage;

  SignInChangePasswordStates(this.massage);
}

class SignInInitialStates extends AbstractionSignInState {}

class SignInLoadingState extends AbstractionSignInState {}

class SignInSuccessState extends AbstractionSignInState {}

class SignInErrorState extends AbstractionSignInState {}

class SignInValidatePhoneNumberState extends AbstractionSignInState {
  String? validationMassage;

  SignInValidatePhoneNumberState({required this.validationMassage});
}
