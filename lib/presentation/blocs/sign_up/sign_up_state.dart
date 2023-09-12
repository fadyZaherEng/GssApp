import 'package:gss/domain/models/validation_model.dart';
import 'package:gss/presentation/blocs/sign_up/sign_up_event.dart';

abstract class AbstractionSignUpState {}

class SignUpInitialState extends AbstractionSignUpState {}

class SignUpLoadingState extends AbstractionSignUpState {}

class SignUpSuccessState extends AbstractionSignUpState {}

class SignUpErrorState extends AbstractionSignUpState {}

class SignUpPressedClosedState extends AbstractionSignUpState {}

class SignUpNavigateToHomeScreenState extends AbstractionSignUpState {
  ValidationModel validationModel;

  SignUpNavigateToHomeScreenState(this.validationModel);
}

class SignUpNavigateToSignInScreenState extends AbstractionSignUpState {}


class SignUpValidateFullNameState extends AbstractionSignUpState {
  String? validationMassage;

  SignUpValidateFullNameState({required this.validationMassage});
}
class SignUpSubmittedFullNameState extends AbstractionSignUpState {
  String? signUpFullName;

  SignUpSubmittedFullNameState({this.signUpFullName});
}
class SignUpChangedFullNameState extends AbstractionSignUpState {
  String? signUpFullName;

  SignUpChangedFullNameState({this.signUpFullName});
}

class SignUpSubmittedPhoneNumberState extends AbstractionSignUpState {}
class SignUpValidatePhoneNumberState extends AbstractionSignUpState {
  String? validationMassage;

  SignUpValidatePhoneNumberState({required this.validationMassage});
}
class SignUpChangedEmailState extends AbstractionSignUpState {
  String? validateMassage;

  SignUpChangedEmailState({this.validateMassage});
}
class SignUpChangedPasswordState extends AbstractionSignUpState {
  String? validateMassage;

  SignUpChangedPasswordState({this.validateMassage});
}