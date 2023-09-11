/// AbstractSignInEvent not events  here and file name
abstract class SignInEvent {}

/// rename to SignInEvent
class SignInSuccessEvent extends SignInEvent {}

class SignInValidatePhoneNumberEvent extends SignInEvent {
  String validatePhoneNumber;

  SignInValidatePhoneNumberEvent({required this.validatePhoneNumber});
}
