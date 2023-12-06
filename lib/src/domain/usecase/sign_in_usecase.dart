import 'package:dartz/dartz.dart';
import 'package:gss/src/core/base/base_usecase.dart';
import 'package:gss/src/data/sources/remote/gbu/failure_response_model.dart';
import 'package:gss/src/domain/entities/requests/sign_in_request/sign_in_request_model.dart';
import 'package:gss/src/domain/entities/responses/gbu_response_model.dart';
import 'package:gss/src/domain/repositories/sign_in_repository.dart';
//debendency injection principles
class SignInUseCase implements BaseUseCase<SignInRequestModel, GbuModel> {
  final SignInRepository _repository;
  SignInUseCase(this._repository);

  @override
  Future<Either<Failure, GbuModel>> execute(SignInRequestModel logInRequestModel) async {
    return await _repository.getLogInData(logInRequestModel);
  }
}
