import 'package:dartz/dartz.dart';
import 'package:gss/data/network/failure.dart';
import 'package:gss/domain/models/test_model.dart';
import 'package:gss/domain/repository/repository.dart';
import 'package:gss/domain/usecase/base_usecase.dart';
//debendency injection principles
class HomeUseCase implements BaseUseCase<void, TestModelResponse> {
  final Repository _repository;
  HomeUseCase(this._repository);

  @override
  Future<Either<Failure, TestModelResponse>> execute(void input) async {
    return await _repository.getHomeData();
  }
}
