abstract class SignInEvent{}
class SignInSuccessEvent extends SignInEvent{}

class SignInValidatePhoneNumberEvent extends SignInEvent{
  String validatePhoneNumber;
  SignInValidatePhoneNumberEvent({required this.validatePhoneNumber});

}