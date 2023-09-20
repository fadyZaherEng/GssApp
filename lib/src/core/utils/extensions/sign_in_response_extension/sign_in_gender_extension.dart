import 'package:gss/src/core/utils/constants/strings.dart';
import 'package:gss/src/core/utils/extensions/int_extension.dart';
import 'package:gss/src/core/utils/extensions/string_extension.dart';
import 'package:gss/src/data/sources/remote/gbu/sign_in/sign_in_response/sign_in_response_gender.dart';
import 'package:gss/src/domain/entities/responses/sign_in_response/sign_in_response_gender.dart';

extension GenderResponseMapper on SignInResponseGender? {
  SignInGender toDomain() {
    return SignInGender(
      id: this?.id.orZero()?? Constants.zero,
      name: this?.name.orEmpty() ?? Constants.empty,
    );
  }
}