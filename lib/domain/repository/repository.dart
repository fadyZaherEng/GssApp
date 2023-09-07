import 'package:dartz/dartz.dart';
import 'package:gss/data/network/failure.dart';
import 'package:gss/domain/models/test_model.dart';


abstract class Repository {
  Future<Either<Failure, TestModelResponse>> getHomeData();
}
