import 'package:gss/src/core/utils/constants/strings.dart';
import 'package:gss/src/core/utils/extensions/int_extension.dart';
import 'package:gss/src/core/utils/extensions/sign_in_response_extension/sign_in_gender_extension.dart';
import 'package:gss/src/core/utils/extensions/sign_in_response_extension/sign_in_nationality_extension.dart';
import 'package:gss/src/core/utils/extensions/string_extension.dart';
import 'package:gss/src/data/sources/remote/gbu/sign_in/sign_in_response/sign_in_response_data.dart';
import 'package:gss/src/domain/entities/responses/sign_in_response/sign_in_response_data.dart';

extension SignInDataResponseMapper on SignInResponseData? {
  SignInData toDomain() {
    return SignInData(
      email: this?.email.orEmpty()??Constants.empty,
      allowUseAgentApp:this?.allowUseAgentApp??false,
      birtDate:this?.birtDate.orEmpty()??Constants.empty,
      fullName:this?.fullName.orEmpty()??Constants.empty,
      gender:this?.gender.toDomain(),
      genderId:this?.genderId.orZero()??Constants.zero,
      id:this?.id.orZero()??Constants.zero,
      isActivation:this?.isActivation??false,
      mobile:this?.mobile.orEmpty()??Constants.empty,
      nationality:this?.nationality.toDomain(),
      nationalityId:this?.nationalityId.orZero()??Constants.zero,
      profileImage:this?.profileImage.orEmpty()??Constants.empty,
      registerType:this?.registerType.orZero()??Constants.zero,
    );
  }
}
