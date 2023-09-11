import 'package:gss/domain/models/validation_model.dart';
import 'package:gss/presentation/blocs/sign_up/sign_up_event.dart';

abstract class AbstractionSignUpState {}

class SignUpInitialStates extends AbstractionSignUpState {}

class SignUpLoadingStates extends AbstractionSignUpState {}

class SignUpSuccessStates extends AbstractionSignUpState {}

class SignUpErrorStates extends AbstractionSignUpState {}

class SignUpPressedClosedStates extends AbstractionSignUpState {}

class SignUpNavigateToHomeScreenStates extends AbstractionSignUpState {
  ValidationModel validationModel;

  SignUpNavigateToHomeScreenStates(this.validationModel);
}

class SignUpNavigateToSignInScreenStates extends AbstractionSignUpState {}


class SignUpValidateFullNameStates extends AbstractionSignUpState {
  String? validationMassage;

  SignUpValidateFullNameStates({required this.validationMassage});
}
class SignUpSubmittedFullNameStates extends AbstractionSignUpState {
  String? signUpFullName;

  SignUpSubmittedFullNameStates({this.signUpFullName});
}
class SignUpChangedFullNameStates extends AbstractionSignUpState {
  String? signUpFullName;

  SignUpChangedFullNameStates({this.signUpFullName});
}

class SignUpSubmittedPhoneNumberStates extends AbstractionSignUpState {}
class SignUpValidatePhoneNumberStates extends AbstractionSignUpState {
  String? validationMassage;

  SignUpValidatePhoneNumberStates({required this.validationMassage});
}
class SignUpChangedEmailStates extends AbstractionSignUpState {
  String? validateMassage;

  SignUpChangedEmailStates({this.validateMassage});
}
class SignUpChangedPasswordStates extends AbstractionSignUpState {
  String? validateMassage;

  SignUpChangedPasswordStates({this.validateMassage});
}