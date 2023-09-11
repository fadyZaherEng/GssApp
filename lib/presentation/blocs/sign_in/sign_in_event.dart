abstract class AbstractSignInEvent {}

class SignInEvent extends AbstractSignInEvent {}

class SignInValidatePhoneNumberEvent extends AbstractSignInEvent {
  String validatePhoneNumber;
  SignInValidatePhoneNumberEvent({required this.validatePhoneNumber});
}
