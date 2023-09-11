abstract class SignInStates {}
class SignInInitialStates extends SignInStates {}
class SignInLoadingStates extends SignInStates {}
class SignInSuccessState extends SignInStates {}
class SignInErrorState extends SignInStates {}
class SignInValidatePhoneNumberState extends SignInStates {
  String? validationMassage;
  SignInValidatePhoneNumberState({required this.validationMassage});
}
