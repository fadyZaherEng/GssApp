import 'package:dartz/dartz.dart';
import 'package:gss/app/extension.dart';
import 'package:gss/data/data_source/local_data_source.dart';
import 'package:gss/data/data_source/remote_data_source.dart';
import 'package:gss/data/network/error_handler.dart';
import 'package:gss/data/network/failure.dart';
import 'package:gss/data/network/network_info.dart';
import 'package:gss/domain/models/test_model.dart';
import 'package:gss/domain/repository/repository.dart';


class RepositoryImpl implements Repository {
  final RemoteDataSource _remoteDataSource;
  final LocalDataSource _localDataSource;
  final NetworkInfo _networkInfo;
  RepositoryImpl(this._remoteDataSource, this._networkInfo,this._localDataSource);

  @override
  Future<Either<Failure, TestModelResponse>> getHomeData() async {
    try {
      // get response from cache
      TestModelResponse response = await _localDataSource.getHomeData();
      return Right(response);
    } catch (cacheError) {
      // cache is not existing or cache is not valid
      // its the time to get from API side
      if (await _networkInfo.isConnected) {
        // its connected to internet, its safe to call API
        try {
          TestModelResponse testModelResponse = await _remoteDataSource.getHomeData();
          if (testModelResponse.status == 'OK') {
            // success
            // return data
            //return either right
            // save response in cache (local data source)
            _localDataSource.saveHomeToCache(testModelResponse);
            return Right(testModelResponse);
          } else {
            // failure --return business error
            // return either left
            return Left(Failure(ApiInternalStatus.FAILURE,
                testModelResponse.status ?? ResponseMessage.DEFAULT));
          }
        } catch (error) {
          return Left(ErrorHandler
              .handle(error)
              .failure);
        }
      } else {
        // return internet connection error
        // return either left
        return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
      }
    }
  }

}
