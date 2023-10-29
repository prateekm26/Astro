import 'dart:convert';

import 'package:astro_app/src/business_layer/network/api_constants.dart';
import 'package:astro_app/src/business_layer/network/request_response_type.dart';
import 'package:astro_app/src/business_layer/util/helper/log_helper.dart';
import 'package:astro_app/src/data_layer/models/astro_list_res_model.dart';
import 'package:astro_app/src/data_layer/models/banner_res_model.dart';
import 'package:astro_app/src/data_layer/models/blog_res_model.dart';
import 'package:http/http.dart' as http;

import '../../data_layer/models/base_api_res_model.dart';

class HomeRepository {
  final String _tag = "Home Repository: ";
  Map<String, dynamic>? _responseBody;

  Future<BaseApiResponseModel> getBannerList() async {
    try {
      final response = await http
          .post(Uri.parse("${ApiConstants.baseUrl}${ApiConstants.bannerList}"));

      LogHelper.logData(_tag + response.body.toString());
      if (response.body != null && response.statusCode == 200) {
        _responseBody = json.decode(response.body.toString());
        //print("res#### ${_responseBody}");
        return BaseApiResponseModel(
            data: BannerResModel.fromJson(_responseBody!));
      } else {
        return BaseApiResponseModel(exceptionType: ExceptionType.apiException);
      }
    } catch (e) {
      LogHelper.logError(_tag + e.toString());
      return BaseApiResponseModel(exceptionType: ExceptionType.parseException);
    }
  }

  Future<BaseApiResponseModel> getAstrologerList() async {
    // try {
    final response = await http
        .post(Uri.parse("${ApiConstants.baseUrl}${ApiConstants.astroList}"));

    LogHelper.logData(_tag + response.body.toString());
    if (response.body != null && response.statusCode == 200) {
      _responseBody = json.decode(response.body.toString());
      return BaseApiResponseModel(
          data: AstroListResModel.fromJson(_responseBody!));
    } else {
      return BaseApiResponseModel(exceptionType: ExceptionType.apiException);
    }
    /*} catch (e) {
      LogHelper.logError(_tag + e.toString());
      return BaseApiResponseModel(exceptionType: ExceptionType.parseException);
    }*/
  }

  Future<BaseApiResponseModel> getBlogList() async {
    try {
      final response = await http
          .post(Uri.parse("${ApiConstants.baseUrl}${ApiConstants.blogList}"));

      LogHelper.logData(_tag + response.body.toString());
      if (response.body != null && response.statusCode == 200) {
        _responseBody = json.decode(response.body.toString());
        return BaseApiResponseModel(
            data: BlogResModel.fromJson(_responseBody!));
      } else {
        return BaseApiResponseModel(exceptionType: ExceptionType.apiException);
      }
    } catch (e) {
      LogHelper.logError(_tag + e.toString());
      return BaseApiResponseModel(exceptionType: ExceptionType.parseException);
    }
  }
}
