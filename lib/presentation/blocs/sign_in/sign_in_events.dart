abstract class LogInEvents{}
///change to SignInEvent
class AppLogInEvent extends LogInEvents{}

///change to SignInValidatePhoneNumberEvent
class ValidatePhoneEventsSignIn extends LogInEvents{
  /// change to validationMassage
  String val;

  ValidatePhoneEventsSignIn({required this.val});
}