// ignore_for_file: avoid_print

import 'package:gss/src/core/utils/constants/strings.dart';
import 'package:gss/src/core/utils/extensions/int_extension.dart';
import 'package:gss/src/core/utils/extensions/sign_in_response_extension/sign_in_data_extension.dart';
import 'package:gss/src/core/utils/extensions/string_extension.dart';
import 'package:gss/src/data/sources/remote/gbu/gbu_response.dart';
import 'package:gss/src/data/sources/remote/gbu/sign_in/sign_in_response/sign_in_response_data.dart';
import 'package:gss/src/domain/entities/responses/gbu_response_model.dart';

extension GbuResponseMapper on GbuResponse? {
  GbuModel toDomain() {
    return GbuModel(
        responseCode: this?.responseCode.orZero()??Constants.zero,
        responseMessage: this?.responseMessage.orEmpty()??Constants.empty,
        responseMessageAr: this?.responseMessageAr.orEmpty()??Constants.empty,
        responseMessageEn: this?.responseMessageEn.orEmpty()??Constants.empty,
        responseRemark: this?.responseRemark.orEmpty()??Constants.empty,
        result:this?.result==null?null:SignInResponseData.fromJson(this?.result).toDomain(),
    );
  }
}
