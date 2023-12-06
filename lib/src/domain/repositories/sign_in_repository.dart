import 'package:dartz/dartz.dart';
import 'package:gss/src/data/sources/remote/gbu/failure_response_model.dart';
import 'package:gss/src/domain/entities/requests/sign_in_request/sign_in_request_model.dart';
import 'package:gss/src/domain/entities/responses/gbu_response_model.dart';


abstract class SignInRepository {
  Future<Either<Failure, GbuModel>> getLogInData(SignInRequestModel signInRequestModel);
}
