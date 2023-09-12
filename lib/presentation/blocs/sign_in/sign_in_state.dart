import 'package:flutter/material.dart';
import 'package:gss/domain/models/sign_in_validation_model.dart';

abstract class AbstractionSignInState {}

class SignInSubmittedPhoneNumberState extends AbstractionSignInState {}

class SignInPressedClosedState extends AbstractionSignInState {}

class SignInPressedForgetPasswordState extends AbstractionSignInState {
  String signInPassword;

  SignInPressedForgetPasswordState(this.signInPassword);
}

class SignInNavigateToHomeScreenState extends AbstractionSignInState {
  SignInValidationModel signInValidationModel;
  SignInNavigateToHomeScreenState({required this.signInValidationModel});
}

class SignInNavigateToSignUpScreenState extends AbstractionSignInState {}

class SignInChangePasswordStates extends AbstractionSignInState {
  String? validationMassage;

  SignInChangePasswordStates({required this.validationMassage});
}

class SignInInitialStates extends AbstractionSignInState {}

class SignInLoadingState extends AbstractionSignInState {}

class SignInSuccessState extends AbstractionSignInState {}

class SignInErrorState extends AbstractionSignInState {}

class SignInValidatePhoneNumberState extends AbstractionSignInState {
  String? validationMassage;

  SignInValidatePhoneNumberState({required this.validationMassage});
}
