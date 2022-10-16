
import 'package:dio/dio.dart';
import 'package:weatherapp_usingbloc/core/strings/url_info.dart';


class DioHelper{
  static Dio? dio;

  static int(){
    dio=Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: 20*1000,
        receiveTimeout: 20*1000,
        receiveDataWhenStatusError: true,
        headers: {
          'content_type': 'application/json',
        }));
  }
  static Future<Response> getRequest(
      {
        required String path, Map<String, dynamic>? queryParameters}) async {
        return await dio!.get(
          path,
          queryParameters: queryParameters,
    );
  }
}
