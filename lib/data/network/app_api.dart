import 'package:dio/dio.dart';
import 'package:gss/domain/models/login_models/login_request/LogInRequestModel.dart';
import 'package:gss/domain/models/login_models/login_response/LoginResponseModel.dart';
import 'package:retrofit/http.dart';
import '../../app/constants.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: Constants.BASE_URL)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;
  //login
  @POST(Constants.SECTION_PATH)
  Future<LoginResponseModel> login(@Body()LogInRequestModel logInRequestModel);
}
//service w remote
//repo
//use case
//bloc