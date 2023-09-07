import 'package:dio/dio.dart';
import 'package:gss/domain/models/test_model.dart';
import 'package:retrofit/http.dart';
import '../../app/constants.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: Constants.BASE_URL)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @GET(Constants.SECTION_PATH)
  Future<TestModelResponse> getHomeData(@Query("api-key") String apiKey,);//@Field()
}
