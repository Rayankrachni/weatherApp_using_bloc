
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:weatherapp_usingbloc/core/constants/endpoint.dart';
import 'package:weatherapp_usingbloc/core/errors/error.dart';
import 'package:weatherapp_usingbloc/core/network/check_network.dart';
import 'package:weatherapp_usingbloc/features/data/Networkhelper/WeatherApi.dart';
import 'package:weatherapp_usingbloc/features/data/model/currentweatherdata.dart';
import 'package:weatherapp_usingbloc/features/data/model/fivedaysdata.dart';

abstract class WeatherRepo{
  Future<Either<Error_Msg, CurrentWeatherData>> getCurrentData();
  Future<Either<Error_Msg, List<FiveDaysData>>> getFiveDaysList();
}

class WeatherRepoImpl implements WeatherRepo {
  final WeatherApi weatherApi;
  final NetworkInfo networkInfo;

  WeatherRepoImpl({required this.weatherApi, required this.networkInfo});
  @override
  Future<Either<Error_Msg, CurrentWeatherData>> getCurrentData() async {
    // TODO: implement getCurrentData
    if(await networkInfo.isConnected)
     {
       print('enterr');
       return await _handleGettingAllPosts();}
    else{
      print('enter@@@');
      return Left(NoInternetFailure());
    }
  }

  @override
  Future<Either<Error_Msg, List<FiveDaysData>>> getFiveDaysList() async {
    // TODO: implement getCurrentData
    if(await networkInfo.isConnected)
    {return await _handleGettingAFiveDays();}
    else{
      return Left(NoInternetFailure());
    }
  }



  Future<Either<Error_Msg, List<FiveDaysData>>>  _handleGettingAFiveDays() async{
    try {
      final weathersRawData = await weatherApi.getFiveDaysWeather('setif');
      final weather = <FiveDaysData>[];
      weathersRawData.forEach((key, weatherRawData) {
        weather.add(FiveDaysData.fromJson(weatherRawData));
      print('from repo${weather.toString()}');

      });
       return Right(weather);

    } on DioError catch (error) {
      if (error.type == DioErrorType.connectTimeout) {
        return Left(TimeoutFailure());
      }
      return Left(ServerFailure());
    } catch (_) {
      return Left(UndefinedFailure());
    }
  }
  Future<Either<Error_Msg, CurrentWeatherData>>  _handleGettingAllPosts() async{
    try {
      print('enterr lPosts');
      final postsRawData = await weatherApi.getWeather('setif');
      print('enterr$postsRawData');
     // final posts = <Post>[];
      return Right(CurrentWeatherData.fromJson(postsRawData));
    } on DioError catch (error) {
      print('error lPosts');
      if (error.type == DioErrorType.connectTimeout) {
        return Left(TimeoutFailure());
      }
      return Left(ServerFailure());
    }
/*    catch (_) {
      print('leftr lPosts');
      return Left(UndefinedFailure());
    }*/
  }
}
