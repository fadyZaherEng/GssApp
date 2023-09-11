/// AbstractSignInEvent not events  here and file name

abstract class SignInEvents {}
/// rename to SignInEvent
class SignInSuccessEvent extends SignInEvents {}

class SignInValidatePhoneNumberEvent extends SignInEvents {
  String validatePhoneNumber;

  SignInValidatePhoneNumberEvent({required this.validatePhoneNumber});
}
