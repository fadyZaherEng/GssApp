import 'package:dio/dio.dart';
import 'package:gss/data/network/app_api.dart';
import 'package:gss/domain/models/test_model.dart';

abstract class RemoteDataSource {
  Future<TestModelResponse> getHomeData();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final AppServiceClient _appServiceClient;

  RemoteDataSourceImpl(this._appServiceClient);
  @override
  Future<TestModelResponse> getHomeData() async {
    return await _appServiceClient.getHomeData('0B5thyIkVSbbRJIPL9DEkOI1AIyC3wls');
  }

}
