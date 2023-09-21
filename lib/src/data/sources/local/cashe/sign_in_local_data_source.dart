// ignore_for_file: constant_identifier_names, prefer_collection_literals
import 'package:gss/src/core/utils/constants/nums.dart';
import 'package:gss/src/core/utils/extensions/cash_item_extension.dart';
import 'package:gss/src/domain/entities/responses/gbu_response_model.dart';
import 'package:gss/src/domain/entities/sign_in_models/sign_in_cathed_item.dart';
import 'package:gss/src/data/sources/remote/gbu/error_handler_response_model.dart';

const CACHE_HOME_KEY = "CACHE_HOME_KEY";
const CACHE_HOME_INTERVAL = 60 * 1000; // 1 minute cache in millis

abstract class SignInLocalDataSource {
  Future<GbuModel> getLogInData();
  Future<void> saveLogInToCache(GbuModel loginResponseModel);
  void clearCache();
  void removeFromCache(String key);
}

class SignInLocalDataSourceImpl implements SignInLocalDataSource {
  // run time cache
  Map<String, CachedItem> cacheMap = Map();
  @override
  Future<GbuModel> getLogInData() async {
    CachedItem? cachedItem = cacheMap[CACHE_HOME_KEY];
    if (cachedItem != null && cachedItem.isValid(CACHE_HOME_INTERVAL)) {
      // return the response from cache
      return cachedItem.data;
    } else {
      throw ErrorsHandler.handle(DataSource.CACHE_ERROR);
    }
  }
  @override
  Future<void> saveLogInToCache(GbuModel loginResponseModel) async {
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