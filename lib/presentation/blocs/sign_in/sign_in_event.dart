import 'package:flutter/material.dart';

abstract class AbstractSignInEvent {}

class SignInEvent extends AbstractSignInEvent {}

class SignInSubmittedPhoneNumberEvent extends AbstractSignInEvent {
  String? signInPhoneNumber;

  SignInSubmittedPhoneNumberEvent({this.signInPhoneNumber});
}

class SignInPressedClosedEvent extends AbstractSignInEvent {}

class SignInPressedForgetPasswordEvent extends AbstractSignInEvent {
  String? signInPhoneNumber;

  SignInPressedForgetPasswordEvent({this.signInPhoneNumber});
}

class SignInNavigateToHomeScreenEvent extends AbstractSignInEvent {
  BuildContext context;
  Widget screen;
  bool validate;

  SignInNavigateToHomeScreenEvent({
    required this.context,
    required this.screen,
    required this.validate,
  });
}

class SignInNavigateToSignUpScreenEvent extends AbstractSignInEvent {
  BuildContext context;
  Widget screen;
  bool validate;

  SignInNavigateToSignUpScreenEvent({
    required this.context,
    required this.screen,
    required this.validate,
  });
}

class SignInChangePasswordEvent extends AbstractSignInEvent {}

class SignInValidatePhoneNumberEvent extends AbstractSignInEvent {
  String validatePhoneNumber;

  SignInValidatePhoneNumberEvent({required this.validatePhoneNumber});
}
