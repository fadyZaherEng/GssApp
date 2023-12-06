class SignInValidationUseCase {
  Future<String?> checkValidateMobile(String? value) async {
    return validateMobile(value);
  }

  String? validateMobile(String? value) {
    String patttern = r'(^(?:[+0]9)?[0-9]{9,12}$)';
    RegExp regExp = RegExp(patttern);
    if (value.toString().isEmpty) {
      return 'Please enter mobile number';
    } else if (!regExp.hasMatch(value.toString())) {
      return 'Please enter valid mobile number';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value.toString().length < 7) {
      return "Password is very Short";
    } else {
      return null;
    }
  }
}