import 'package:dartz/dartz.dart';
import 'package:gss/app/extension.dart';
import 'package:gss/data/data_source/sign_in_local_data_source.dart';
import 'package:gss/data/network/error_handler.dart';
import 'package:gss/data/network/failure.dart';
import 'package:gss/data/network/network_info.dart';
import 'package:gss/data/network/sign_in_service/login_service.dart';
import 'package:gss/domain/models/sign_in_models/sign_in_request/sign_in_request_model.dart';
import 'package:gss/domain/models/sign_in_models/sign_in_response/sign_in_response_model.dart';
import 'package:gss/domain/repository/sign_in_repository.dart';

class SignInRepositoryImpl implements SignInRepository {
  final SignInLocalDataSource localDataSource;
  final NetworkInfo networkInfo;
  final SignInServiceClient signInServiceClient;

  SignInRepositoryImpl({
    required this.signInServiceClient,
    required this.networkInfo,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, SignInResponseModel>> getLogInData(
      SignInRequestModel logInRequestModel) async {
    try {
      // get response from cache
      SignInResponseModel response = await localDataSource.getLogInData();
      return Right(response);
    } catch (cacheError) {
      if (await networkInfo.isConnected) {
        try {
          SignInResponseModel loginResponse =
              await signInServiceClient.login(logInRequestModel);
          if (loginResponse.headerResponse.responseCode == 1) {
            localDataSource.saveLogInToCache(loginResponse);
            return Right(loginResponse);
          } else {
            return Left(Failure(
                ApiInternalStatus.FAILURE,
                loginResponse.headerResponse.responseMessage ??
                    ResponseMessage.DEFAULT));
          }
        } catch (error) {
          return Left(ErrorHandler.handle(error).failure);
        }
      } else {
        return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
      }
    }
  }
}
