abstract class SignInEvents{}
class SignInSuccessEvent extends SignInEvents{}

class SignInValidatePhoneNumberEvent extends SignInEvents{
  String validatePhoneNumber;
  SignInValidatePhoneNumberEvent({required this.validatePhoneNumber});

}