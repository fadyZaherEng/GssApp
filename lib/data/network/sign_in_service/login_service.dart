import 'package:dio/dio.dart';
import 'package:gss/app/constants.dart';
import 'package:gss/domain/models/sign_in_models/sign_in_request/sign_in_request_model.dart';
import 'package:gss/domain/models/sign_in_models/sign_in_response/sign_in_response_model.dart';
import 'package:retrofit/http.dart';

part 'login_service.g.dart';

@RestApi(baseUrl: Constants.BASE_URL)
abstract class SignInServiceClient {
  factory SignInServiceClient(Dio dio, {String baseUrl}) = _SignInServiceClient;
  //login
  @POST(Constants.SECTION_PATH)
  Future<SignInResponseModel> login(@Body()SignInRequestModel logInRequestModel);
}
//service w remote
//repo
//use case
//bloc