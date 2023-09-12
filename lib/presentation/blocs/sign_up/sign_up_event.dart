import 'package:flutter/material.dart';

abstract class AbstractionSignUpEvent {}

class SignUpUpInitialEvents extends AbstractionSignUpEvent {}

class SignUpEvents extends AbstractionSignUpEvent {
  BuildContext context;
  Widget screen;
  String email;
  String password;
  String phone;
  String name;

  SignUpEvents({
    required this.context,
    required this.screen,
    required this.phone,
    required this.name,
    required this.password,
    required this.email,
  });
}

class SignUpPressedClosedEvent extends AbstractionSignUpEvent {}

class SignUpNavigateToSignInScreenEvent extends AbstractionSignUpEvent {
  BuildContext context;
  Widget screen;
  bool validate;

  SignUpNavigateToSignInScreenEvent({
    required this.context,
    required this.screen,
    this.validate = true,
  });
}

class SignUpAlreadyHaveAccountEvent extends AbstractionSignUpEvent {
  BuildContext context;
  Widget screen;
  bool validate;

  SignUpAlreadyHaveAccountEvent({
    required this.context,
    required this.screen,
    this.validate = true,
  });
}

class SignUpValidateFullNameEvents extends AbstractionSignUpEvent {
  String signUpFullName;

  SignUpValidateFullNameEvents({required this.signUpFullName});
}
class SignUpChangedFullNameEvents extends AbstractionSignUpEvent {
  String? signUpFullName;

  SignUpChangedFullNameEvents({this.signUpFullName});
}
class SignUpSubmittedFullNameEvents extends AbstractionSignUpEvent {
  String? signUpFullName;

  SignUpSubmittedFullNameEvents({this.signUpFullName});
}

class SignUpSubmittedPhoneNumberEvents extends AbstractionSignUpEvent {
  String? signUpPhoneNumber;

  SignUpSubmittedPhoneNumberEvents({this.signUpPhoneNumber});
}

class SignUpValidatePhoneEvents extends AbstractionSignUpEvent {
  String signUpPhoneNumber;

  SignUpValidatePhoneEvents({required this.signUpPhoneNumber});
}
class SignUpChangedEmailEvents extends AbstractionSignUpEvent {
  String signUpEmail;

  SignUpChangedEmailEvents({required this.signUpEmail});
}
class SignUpChangedPasswordEvents extends AbstractionSignUpEvent {
  String signUpPassword;

  SignUpChangedPasswordEvents({required this.signUpPassword});
}