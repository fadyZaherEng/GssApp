// ignore_for_file: deprecated_member_use, constant_identifier_names
import 'package:dio/dio.dart';
import 'package:gss/src/core/utils/constants/nums.dart';
import 'package:gss/src/core/utils/error_handler.dart';
import 'package:gss/src/core/utils/extensions/data_source_extension.dart';
import 'package:gss/src/data/sources/remote/gbu/failure_response_model.dart';

class ErrorsHandler {
  late Failure failure;

  ErrorsHandler.handle(dynamic error) {
    if (error is DioException || error is DioError) {
      // dio error so its an error from response of the API or from dio itself
      failure = handleError(error);
    } else {
      // default error
      failure = DataSource.DEFAULT.getFailure();
    }
  }
}
