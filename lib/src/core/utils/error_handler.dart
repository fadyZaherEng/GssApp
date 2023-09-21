// ignore_for_file: deprecated_member_use

import 'package:dio/dio.dart';
import 'package:gss/src/core/utils/constants/nums.dart';
import 'package:gss/src/core/utils/extensions/data_source_extension.dart';
import 'package:gss/src/data/sources/remote/gbu/failure_response_model.dart';
Failure handleError(DioError error) {
  switch (error.type) {
    case DioErrorType.connectionTimeout:
      return DataSource.CONNECT_TIMEOUT.getFailure();
    case DioErrorType.sendTimeout:
      return DataSource.SEND_TIMEOUT.getFailure();
    case DioErrorType.receiveTimeout:
      return DataSource.RECIEVE_TIMEOUT.getFailure();
    case DioErrorType.badResponse:
      if (error.response != null &&
          error.response?.statusCode != null &&
          error.response?.statusMessage != null) {
        return Failure(error.response?.statusCode ?? 0,
            error.response?.statusMessage ?? "");
      } else {
        return DataSource.DEFAULT.getFailure();
      }
    case DioErrorType.cancel:
      return DataSource.CANCEL.getFailure();
    default:
      return DataSource.DEFAULT.getFailure();
  }
}