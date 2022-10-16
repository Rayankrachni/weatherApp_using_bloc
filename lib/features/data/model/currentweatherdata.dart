

import 'package:weatherapp_usingbloc/features/data/model/clouds.dart';
import 'package:weatherapp_usingbloc/features/data/model/coords.dart';
import 'package:weatherapp_usingbloc/features/data/model/main_weather.dart';
import 'package:weatherapp_usingbloc/features/data/model/sys.dart';
import 'package:weatherapp_usingbloc/features/data/model/weather.dart';
import 'package:weatherapp_usingbloc/features/data/model/wind.dart';

class CurrentWeatherData
{
  Coord? coord;
  List<Weather>? weather;
  String? base;
  MainWeather? main;
  int? visibility;
  Wind? wind;
  Clouds? clouds;
  Sys? sys;
  int? timezone;
  int? id;
  String? name;
  int? cod;
  CurrentWeatherData({this.coord,this.weather,this.base,this.main,this.visibility,this.wind,this.clouds,this.sys,this.timezone,this.id,this.name,this.cod,});

  factory CurrentWeatherData.fromJson(Map<String, dynamic> json){
    return CurrentWeatherData(
      coord: Coord.fromJson(json['coord']),
      weather: List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
      base: json['base'],
      main: MainWeather.fromJson(json['main']),
      //int
      visibility: json['visibility'],
      wind: Wind.fromJson(json['wind']),
      clouds: Clouds.fromJson(json['clouds']),
      sys: Sys.fromJson(json['sys']),
      //int.parse(
      timezone: json['timezone'],
      id: json['id'],
      name: json['name'],
      //int.parse(
      cod: json['cod'],

    );
  }
  Map<String, dynamic> toJson(){
    return {
      'coord':this.coord,
      'weather':this.weather,
      'base':this.base,
      'main':this.main,
      'visibility':this.visibility,
      'wind':this.wind,
      'clouds':this.clouds,
      'sys':this.sys,
      'timezone':this.timezone,
      'id':this.id,
      'name':this.name,
      'cod':this.cod,

    };
  }


}