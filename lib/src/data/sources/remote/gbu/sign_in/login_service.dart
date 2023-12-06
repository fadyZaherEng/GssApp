import 'package:dio/dio.dart';
import 'package:gss/src/core/utils/constants/strings.dart';
import 'package:gss/src/data/sources/remote/gbu/gbu_response.dart';
import 'package:gss/src/domain/entities/requests/sign_in_request/sign_in_request_model.dart';
import 'package:retrofit/http.dart';

part 'login_service.g.dart';

@RestApi(baseUrl: Constants.BASE_URL)
abstract class SignInServiceClient {
  factory SignInServiceClient(Dio dio, {String baseUrl}) = _SignInServiceClient;
  //login
  @POST(Constants.SECTION_PATH)
  Future<GbuResponse> login(@Body()SignInRequestModel logInRequestModel);
}
