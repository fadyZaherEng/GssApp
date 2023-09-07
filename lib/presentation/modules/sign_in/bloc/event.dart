abstract class LogInEvents{}

class AppLogInEvent extends LogInEvents{}

class ValidatePhoneEventsSignIn extends LogInEvents{
  String val;

  ValidatePhoneEventsSignIn({required this.val});
}