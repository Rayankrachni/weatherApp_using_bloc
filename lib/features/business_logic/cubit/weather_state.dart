part of 'weather_cubit.dart';

@immutable
abstract class WeatherState {}

class WeatherInitial extends WeatherState {}
class WeatherLoading extends WeatherState {}
class MyPostsGettingAllDataFailedState extends WeatherState {
  final String failMsg;

  MyPostsGettingAllDataFailedState(this.failMsg);
}
class MyCurrentGetAllPostsSuccessfullyState extends WeatherState {
  final List<CurrentWeatherData> weather;

  MyCurrentGetAllPostsSuccessfullyState(this.weather);
}

class FiveDaysGetAllPostsSuccessfullyState extends WeatherState {
  final List<FiveDaysData> fivedaysweatherdata;

  FiveDaysGetAllPostsSuccessfullyState(this.fivedaysweatherdata);
}

