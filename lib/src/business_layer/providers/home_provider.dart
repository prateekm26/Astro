import 'package:astro_app/src/business_layer/providers/base_provider.dart';
import 'package:astro_app/src/business_layer/repository/home_repository.dart';
import 'package:astro_app/src/data_layer/models/astro_list_res_model.dart';
import 'package:astro_app/src/data_layer/models/banner_res_model.dart';
import 'package:astro_app/src/data_layer/models/base_api_res_model.dart';
import 'package:astro_app/src/data_layer/models/blog_res_model.dart';

import '../network/request_response_type.dart';

class HomeProvider extends BaseProvider {
  final HomeRepository _homeRepository = HomeRepository();
  BannerResModel _bannerResModel = BannerResModel();
  AstroListResModel _astroListResModel = AstroListResModel();
  BlogResModel _blogResModel = BlogResModel();
  bool _loading = false;

  /// Api to get banner list
  Future<String?> getBannerList() async {
    if (await checkInternet()) {
      BaseApiResponseModel response = await _homeRepository.getBannerList();
      if (response.data != null && response.data is BannerResModel) {
        _bannerResModel = response.data;
        if (_bannerResModel.status == 200) {
          print("user fetched");
          notifyListeners();
          return HttpResponseType.success;
        } else {
          return "Something went wrong";
        }
      } else {
        return getExceptionMessage(exceptionType: response.exceptionType);
      }
    } else {
      return "No internet";
    }
  }

  /// api to get astrologer list response
  Future<String?> getAstroList() async {
    if (await checkInternet()) {
      BaseApiResponseModel response = await _homeRepository.getAstrologerList();
      if (response.data != null && response.data is AstroListResModel) {
        _astroListResModel = response.data;
        if (_astroListResModel.status == 200) {
          print("post fetched");
          notifyListeners();
          return HttpResponseType.success;
        } else {
          return "Something went wrong";
        }
      } else {
        return getExceptionMessage(exceptionType: response.exceptionType);
      }
    } else {
      return "No internet";
    }
  }

  /// api to get blog list response
  Future<String?> getBlogList() async {
    if (await checkInternet()) {
      BaseApiResponseModel response = await _homeRepository.getBlogList();
      if (response.data != null && response.data is BlogResModel) {
        _blogResModel = response.data;
        if (_blogResModel.status == 200) {
          print("post fetched");
          notifyListeners();
          return HttpResponseType.success;
        } else {
          return "Something went wrong";
        }
      } else {
        return getExceptionMessage(exceptionType: response.exceptionType);
      }
    } else {
      return "No internet";
    }
  }

  AstroListResModel get astroListResModel => _astroListResModel;

  BlogResModel get blogResModel => _blogResModel;

  BannerResModel get bannerResModel => _bannerResModel;

  bool get loading => _loading;

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }
}
