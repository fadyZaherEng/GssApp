import 'package:dio/dio.dart';
import 'package:gss/app/constants.dart';
import 'package:gss/domain/models/sign_in_models/sign_in_request/LogInRequestModel.dart';
import 'package:gss/domain/models/sign_in_models/sign_in_response/LoginResponseModel.dart';
import 'package:retrofit/http.dart';

part 'login_service.g.dart';

@RestApi(baseUrl: Constants.BASE_URL)
abstract class LogInServiceClient {
  factory LogInServiceClient(Dio dio, {String baseUrl}) = _LogInServiceClient;
  //login
  @POST(Constants.SECTION_PATH)
  Future<LoginResponseModel> login(@Body()LogInRequestModel logInRequestModel);
}
//service w remote
//repo
//use case
//bloc