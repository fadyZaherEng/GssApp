abstract class RegisterEvents{}
class InitialRegisterEvents extends RegisterEvents{}
class SignUpEvents extends RegisterEvents{}

class ValidatePhoneEvents extends RegisterEvents{
  String val;

  ValidatePhoneEvents({required this.val});
}