
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
  Future<Either<Error_Msg, List<CurrentWeatherData>>> get48Willaya();
  Future<Either<Error_Msg, List<FiveDaysData>>> getFiveDaysList();
}

class WeatherRepoImpl implements WeatherRepo {
  final WeatherApi weatherApi;
  final NetworkInfo networkInfo;


  WeatherRepoImpl({required this.weatherApi, required this.networkInfo});

  final List<String> willaya=['Adrar','Chlef','Laghouat','Oum El Bouaghi','Batna','Béjaïa',
    'Biskra','Béchar','Blida','Bouira','Tamanrasset','Tébessa','Tlemcen','Tiaret',
    'Tizi Ouzou','Alger','Djelfa','Jijel','Setif','Saïda','Skikda','Sidi Bel Abbès',
    'Annaba','Guelma','Constantine','Médéa','Mostaganem','MSila','Mascara','Ouargla ',
    'Oran','Illizi','Bordj Bou Arreridj','Boumerdes','El Tarf','Tindouf','Tissemsilt',
    'El Oued','Khenchela','Souk Ahras','Tipaza','Mila','Aïn Témouchent',
    'Ghardaïa','Relizane','Timimoun','Bordj Badji Mokhtar','Ouled Djellal','In Salah','Touggourt',

  ];
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
    try{
      print('----_handleGettingAFiveDays---');
      final weathersRawData = await weatherApi.getFiveDaysWeather('setif');
      print('----_handleGettingAFiveDays-$weathersRawData--');
      final weather = <FiveDaysData>[];
      weathersRawData.forEach((key, weatherRawData) {
        weather.add(FiveDaysData.fromJson(weatherRawData));
      print('from repo${weather.toString()}');

      });
       return Right(weather);

    } on DioError catch (error) {
      print('----Error_handleGettingAFiveDays---');
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
      final postsRawData = await weatherApi.getWeather('El Meniaa' );
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

  Future<Either<Error_Msg, List<CurrentWeatherData>>>  _handle48willaya() async{
    try {
      print('enterr lPosts');

      List<CurrentWeatherData> willayaData=[];


      for(int i=0;i<willaya.length;i++)
      {
       final postsRawData = await weatherApi.getWeather(willaya[i]);
       willayaData.add(CurrentWeatherData.fromJson(postsRawData));
       print('-----------');
       print(postsRawData);
      }
     // print('enterr$postsRawData');
      // final posts = <Post>[];
      return Right(willayaData);
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

  @override
  Future<Either<Error_Msg, List<CurrentWeatherData>>> get48Willaya() async{
    // TODO: implement get48Willaya

      if(await networkInfo.isConnected)
      {
        print('enterr');
        return await _handle48willaya();}
      else{
        print('enter@@@');
        return Left(NoInternetFailure());
      }
    }
  }


