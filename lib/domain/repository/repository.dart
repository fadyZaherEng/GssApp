import 'package:dartz/dartz.dart';
import 'package:gss/data/network/failure.dart';
import 'package:gss/domain/models/login_models/login_request/LogInRequestModel.dart';
import 'package:gss/domain/models/login_models/login_response/LoginResponseModel.dart';


abstract class Repository {
  Future<Either<Failure, LoginResponseModel>> getLogInData(LogInRequestModel logInRequestModel);
}
