import 'package:dartz/dartz.dart';
import 'package:gss/src/core/utils/constants/nums.dart';
import 'package:gss/src/core/utils/constants/strings.dart';
import 'package:gss/src/core/utils/extensions/data_source_extension.dart';
import 'package:gss/src/core/utils/extensions/sign_in_response_extension/gbu_reponse_extension.dart';
import 'package:gss/src/data/sources/local/cashe/sign_in_local_data_source.dart';
import 'package:gss/src/data/sources/remote/gbu/error_handler_response_model.dart';
import 'package:gss/src/data/sources/remote/gbu/failure_response_model.dart';
import 'package:gss/src/data/repositories/remote_repositories/network_info_impl.dart';
import 'package:gss/src/data/sources/remote/gbu/gbu_response.dart';
import 'package:gss/src/data/sources/remote/gbu/sign_in/login_service.dart';
import 'package:gss/src/domain/entities/requests/sign_in_request/sign_in_request_model.dart';
import 'package:gss/src/domain/entities/responses/gbu_response_model.dart';
import 'package:gss/src/domain/repositories/sign_in_repository.dart';

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
  Future<Either<Failure, GbuModel>> getLogInData(
      SignInRequestModel logInRequestModel) async {
    try {
      // get response from cache
      GbuModel response = await localDataSource.getLogInData();
      return Right(response);
    } catch (cacheError) {
      if (await networkInfo.isConnected) {
        try {
          GbuResponse response =
              await signInServiceClient.login(logInRequestModel);
          GbuModel signInResponse = response.toDomain();
          if (signInResponse.responseCode == 1) {
            localDataSource.saveLogInToCache(signInResponse);
            return Right(signInResponse);
          } else {
            return Left(
              Failure(
               Constants.zero,
                signInResponse.responseMessage,
              ),
            );
          }
        } catch (error) {
          return Left(ErrorsHandler.handle(error).failure);
        }
      } else {
        return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
      }
    }
  }
}
