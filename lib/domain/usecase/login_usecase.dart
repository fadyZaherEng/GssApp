import 'package:dartz/dartz.dart';
import 'package:gss/data/network/failure.dart';
import 'package:gss/domain/models/login_models/login_request/LogInRequestModel.dart';
import 'package:gss/domain/models/login_models/login_response/LoginResponseModel.dart';
import 'package:gss/domain/repository/repository.dart';
import 'package:gss/domain/usecase/base_usecase.dart';
//debendency injection principles
class LogInUseCase implements BaseUseCase<LogInRequestModel, LoginResponseModel> {
  final Repository _repository;
  LogInUseCase(this._repository);

  @override
  Future<Either<Failure, LoginResponseModel>> execute(LogInRequestModel logInRequestModel) async {
    return await _repository.getLogInData(logInRequestModel);
  }
}
