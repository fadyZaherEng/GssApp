import 'package:dartz/dartz.dart';
import 'package:gss/app/extension.dart';
import 'package:gss/data/data_source/local_data_source.dart';
import 'package:gss/data/data_source/remote_data_source.dart';
import 'package:gss/data/network/error_handler.dart';
import 'package:gss/data/network/failure.dart';
import 'package:gss/data/network/network_info.dart';
import 'package:gss/domain/models/login_models/login_request/LogInRequestModel.dart';
import 'package:gss/domain/models/login_models/login_response/LoginResponseModel.dart';
import 'package:gss/domain/repository/repository.dart';


class RepositoryImpl implements Repository {
  final RemoteDataSource _remoteDataSource;
  final LocalDataSource _localDataSource;
  final NetworkInfo _networkInfo;
  RepositoryImpl(this._remoteDataSource, this._networkInfo,this._localDataSource);

  @override
  Future<Either<Failure, LoginResponseModel>> getLogInData(LogInRequestModel logInRequestModel) async{
    try {
      // get response from cache
      LoginResponseModel response = await _localDataSource.getLogInData();
      return Right(response);
    } catch (cacheError) {
      if (await _networkInfo.isConnected) {
        try {
          LoginResponseModel loginResponse= await _remoteDataSource.getLogInData(logInRequestModel);
          if (loginResponse.responseCode == 1) {
            // success
            // return data
            //return either right
            // save response in cache (local data source)
            _localDataSource.saveLogInToCache(loginResponse);
            return Right(loginResponse);
          }
          else {
            return Left(Failure(ApiInternalStatus.FAILURE, loginResponse.responseMessage ?? ResponseMessage.DEFAULT));
          }
        } catch (error) {
          return Left(ErrorHandler.handle(error).failure);
        }
      }
      else {
        return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
      }
    }
  }

}
