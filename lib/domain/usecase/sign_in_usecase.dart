import 'package:dartz/dartz.dart';
import 'package:gss/data/network/failure.dart';
import 'package:gss/domain/models/sign_in_models/sign_in_request/sign_in_request_model.dart';
import 'package:gss/domain/models/sign_in_models/sign_in_response/sign_in_response_model.dart';
import 'package:gss/domain/repository/sign_in_repository.dart';
import 'package:gss/domain/usecase/base_usecase.dart';
//debendency injection principles
class SignInUseCase implements BaseUseCase<SignInRequestModel, SignInResponseModel> {
  final SignInRepository _repository;
  SignInUseCase(this._repository);

  @override
  Future<Either<Failure, SignInResponseModel>> execute(SignInRequestModel logInRequestModel) async {
    return await _repository.getLogInData(logInRequestModel);
  }
}
