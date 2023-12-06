

// ignore_for_file: constant_identifier_names

import 'package:gss/src/core/utils/constants/strings.dart';

class ResponseMessage {
  static const String SUCCESS = Constants.success; // success with data
  static const String NO_CONTENT =
      Constants.success; // success with no data (no content)
  static const String BAD_REQUEST =
      Constants.badRequestError; // failure, API rejected request
  static const String UNAUTORISED =
      Constants.unauthorizedError; // failure, user is not authorised
  static const String FORBIDDEN =
      Constants.forbiddenError; //  failure, API rejected request
  static const String INTERNAL_SERVER_ERROR =
      Constants.internalServerError; // failure, crash in server side
  static const String NOT_FOUND =
      Constants.notFoundError; // failure, crash in server side

  // local status code
  static const String CONNECT_TIMEOUT = Constants.timeoutError;
  static const String CANCEL = Constants.defaultError;
  static const String RECIEVE_TIMEOUT = Constants.timeoutError;
  static const String SEND_TIMEOUT = Constants.timeoutError;
  static const String CACHE_ERROR = Constants.cacheError;
  static const String NO_INTERNET_CONNECTION = Constants.noInternetError;
  static const String DEFAULT = Constants.defaultError;
}