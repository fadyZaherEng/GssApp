// ignore_for_file: constant_identifier_names
import 'package:gss/data/data_source/sign_in_local_data_source.dart';
import 'package:gss/data/network/error_handler.dart';
import 'package:gss/domain/models/sign_in_models/sign_in_cathed_item.dart';
import 'package:gss/domain/models/sign_in_models/sign_in_response/sign_in_response_model.dart';
import 'package:gss/app/extension.dart';
const CACHE_HOME_KEY = "CACHE_HOME_KEY";
const CACHE_HOME_INTERVAL = 60 * 1000; // 1 minute cache in millis

abstract class SignInLocalDataSource {
  Future<SignInResponseModel> getLogInData();
  Future<void> saveLogInToCache(SignInResponseModel loginResponseModel);
  void clearCache();
  void removeFromCache(String key);
}

class SignInLocalDataSourceImpl implements SignInLocalDataSource {
  // run time cache
  Map<String, CachedItem> cacheMap = Map();
  @override
  Future<SignInResponseModel> getLogInData() async {
    CachedItem? cachedItem = cacheMap[CACHE_HOME_KEY];
    if (cachedItem != null && cachedItem.isValid(CACHE_HOME_INTERVAL)) {
      // return the response from cache
      return cachedItem.data;
    } else {
      throw ErrorHandler.handle(DataSource.CACHE_ERROR);
    }
  }
  @override
  Future<void> saveLogInToCache(SignInResponseModel loginResponseModel) async {
    cacheMap[CACHE_HOME_KEY] = CachedItem(loginResponseModel);
  }
  @override
  void clearCache() {
    cacheMap.clear();
  }
  @override
  void removeFromCache(String key) {
    cacheMap.remove(key);
  }
}