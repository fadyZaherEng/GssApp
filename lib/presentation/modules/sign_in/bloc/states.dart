abstract class LogInStates{}

class InitialLogINStates extends LogInStates{}
class LoadingLogINStates extends LogInStates{}
class SuccessLogINStates extends LogInStates{}
class ErrorLogINStates extends LogInStates{}


class ValidatePhoneLoginStates extends LogInStates{
  String? res;

  ValidatePhoneLoginStates({required this.res});
}