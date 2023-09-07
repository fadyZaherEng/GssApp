abstract class RegisterStates{}

class InitialRegisterStates extends RegisterStates{}
class LoadingRegisterStates extends RegisterStates{}
class SuccessRegisterStates extends RegisterStates{}
class ErrorRegisterStates extends RegisterStates{}


class ValidatePhoneStates extends RegisterStates{
  String? res;

  ValidatePhoneStates({required this.res});
}