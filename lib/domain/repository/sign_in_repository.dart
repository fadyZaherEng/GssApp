import 'package:dartz/dartz.dart';
import 'package:gss/data/network/failure.dart';
import 'package:gss/domain/models/sign_in_models/sign_in_request/sign_in_request_model.dart';
import 'package:gss/domain/models/sign_in_models/sign_in_response/sign_in_response_model.dart';


abstract class SignInRepository {
  Future<Either<Failure, SignInResponseModel>> getLogInData(SignInRequestModel signInRequestModel);
}
