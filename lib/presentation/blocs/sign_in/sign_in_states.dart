abstract class LogInStates {}

///Change to SignInInitialState
class InitialLogINStates extends LogInStates {}

/// Change to SignInLoadingState
class LoadingLogINStates extends LogInStates {}

///Change to SignInSuccessState
class SuccessLogINStates extends LogInStates {}

///Change to SignInErrorState
class ErrorLogINStates extends LogInStates {}

///Change to SignInValidatePhoneNumberState
class ValidatePhoneLoginStates extends LogInStates {
  String? res;

  ValidatePhoneLoginStates({required this.res});
}
