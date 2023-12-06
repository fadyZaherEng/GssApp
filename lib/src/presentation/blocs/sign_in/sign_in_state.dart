import 'package:flutter/material.dart';
import 'package:gss/src/domain/entities/responses/gbu_response_model.dart';
import 'package:gss/src/domain/entities/sign_in_models/sign_in_validation_model.dart';

abstract class AbstractionSignInState {}

class SignInSubmittedPhoneNumberState extends AbstractionSignInState {}

class SignInPressedClosedState extends AbstractionSignInState {}
class SignInChangeLangState extends AbstractionSignInState {
  Locale locale;
  SignInChangeLangState(this.locale);
}
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
  String? signInPasswordValidationMassage;

  SignInChangePasswordStates({required this.signInPasswordValidationMassage});
}

class SignInInitialStates extends AbstractionSignInState {}

class SignInLoadingState extends AbstractionSignInState {}

class SignInSuccessState extends AbstractionSignInState {
  GbuModel signInResponseModel;

  SignInSuccessState({required this.signInResponseModel});
}

class SignInErrorState extends AbstractionSignInState {}

class SignInValidatePhoneNumberState extends AbstractionSignInState {
  String? signInPhoneValidationMassage;

  SignInValidatePhoneNumberState({required this.signInPhoneValidationMassage});
}
