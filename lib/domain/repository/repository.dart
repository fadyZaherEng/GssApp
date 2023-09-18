import 'package:dartz/dartz.dart';
import 'package:gss/data/network/failure.dart';
import 'package:gss/domain/models/sign_in_models/sign_in_request/LogInRequestModel.dart';
import 'package:gss/domain/models/sign_in_models/sign_in_response/LoginResponseModel.dart';


abstract class Repository {
  Future<Either<Failure, LoginResponseModel>> getLogInData(LogInRequestModel logInRequestModel);
}
