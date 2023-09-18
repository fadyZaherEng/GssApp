import 'package:gss/data/network/app_api.dart';
import 'package:gss/domain/models/login_models/login_request/LogInRequestModel.dart';
import 'package:gss/domain/models/login_models/login_response/LoginResponseModel.dart';

abstract class RemoteDataSource {
  // Future<TestModelResponse> getHomeData();
  Future<LoginResponseModel> getLogInData(LogInRequestModel logInRequestModel);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final AppServiceClient _appServiceClient;
  RemoteDataSourceImpl(this._appServiceClient);
  @override
  Future<LoginResponseModel> getLogInData(LogInRequestModel logInRequestModel) async {
    return await _appServiceClient.login(logInRequestModel);
  }
}
