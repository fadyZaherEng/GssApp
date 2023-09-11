import 'package:flutter/material.dart';

abstract class AbstractionSignInState {}

class SignInSubmittedPhoneNumberStates extends AbstractionSignInState {}

class SignInPressedClosedStates extends AbstractionSignInState {}

class SignInPressedForgetPasswordStates extends AbstractionSignInState {
  String signInPassword;

  SignInPressedForgetPasswordStates(this.signInPassword);
}

class SignInNavigateToHomeScreenStates extends AbstractionSignInState {}

class SignInNavigateToSignUpScreenStates extends AbstractionSignInState {}

class SignInChangePasswordStates extends AbstractionSignInState {
  String massage;

  SignInChangePasswordStates(this.massage);
}

class SignInInitialStates extends AbstractionSignInState {}

class SignInLoadingStates extends AbstractionSignInState {}

class SignInSuccessState extends AbstractionSignInState {}

class SignInErrorState extends AbstractionSignInState {}

class SignInValidatePhoneNumberState extends AbstractionSignInState {
  String? validationMassage;

  SignInValidatePhoneNumberState({required this.validationMassage});
}
