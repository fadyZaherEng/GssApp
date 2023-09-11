abstract class SignInState {}

class SignInInitialStates extends SignInState {}

class SignInLoadingStates extends SignInState {}

class SignInSuccessState extends SignInState {}

class SignInErrorState extends SignInState {}

class SignInValidatePhoneNumberState extends SignInState {
  String? validationMassage;

  SignInValidatePhoneNumberState({required this.validationMassage});
}
