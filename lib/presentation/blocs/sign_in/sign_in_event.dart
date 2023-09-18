import 'package:flutter/material.dart';
import 'package:gss/domain/usecase/login_usecase.dart';

abstract class AbstractSignInEvent {}

class SignInEvent extends AbstractSignInEvent {
  LogInUseCase logInUseCase;
  String logInPhone, logInPassword;

  SignInEvent({
    required this.logInUseCase,
    required this.logInPassword,
    required this.logInPhone,
  });
}

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
  String phone, password;

  SignInNavigateToHomeScreenEvent({
    required this.phone,
    required this.password,
  });
}

class SignInNavigateToSignUpScreenEvent extends AbstractSignInEvent {
  BuildContext context;
  Widget screen;
  bool validate;

  SignInNavigateToSignUpScreenEvent({
    required this.context,
    required this.screen,
    this.validate = true,
  });
}

class SignInChangePasswordEvent extends AbstractSignInEvent {
  String? signInPassword;

  SignInChangePasswordEvent({required this.signInPassword});
}

class SignInValidatePhoneNumberEvent extends AbstractSignInEvent {
  String validatePhoneNumber;

  SignInValidatePhoneNumberEvent({required this.validatePhoneNumber});
}

class SignInChangeLangEvent extends AbstractSignInEvent {
  BuildContext context;

  SignInChangeLangEvent({required this.context});
}
