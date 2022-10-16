
import 'package:dio/src/response.dart';
import 'package:weatherapp_usingbloc/core/constants/endpoint.dart';
import 'package:weatherapp_usingbloc/core/network/remote_network/dio_helper.dart';

import '../../../core/strings/url_info.dart';

abstract class WeatherApi{

  Future<Map<String, dynamic>> getWeather(String city);
  Future<Map<String, dynamic>> getFiveDaysWeather(String city);
}

class WeatherApiwithDioImpl implements WeatherApi{

  @override
  Future<Map<String, dynamic>> getWeather(String city) async{
    // TODO: implement getWeather
    print(weatherpath+city+'&'+apikey);
    final response= await DioHelper.getRequest(path: weatherpath+city+'&'+apikey);
    if (_canBeParsed(response)) {
      return response.data;
    } else {
      return {};
    }
  }

  bool _canBeParsed(Response response) {
    if (response.statusCode == 200 && response.data is Map<String, dynamic>) {
      return true;
    }
    return false;
  }

  @override
  Future<Map<String, dynamic>> getFiveDaysWeather(String city) async{
    // TODO: implement getWeather
    print(fivedaysweathrpath1+city+fivedaysweathrpath2+apikey);
    final response= await DioHelper.getRequest(path:fivedaysweathrpath1+'setif'+fivedaysweathrpath2+apikey);
    if (_canBeParsed(response)) {
      return response.data;
    } else {
      return {};
    }
  }


}