import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weatherapp_usingbloc/features/data/WeatherRepo/weather_repo.dart';
import 'package:weatherapp_usingbloc/features/data/model/currentweatherdata.dart';
import 'package:weatherapp_usingbloc/features/data/model/fivedaysdata.dart';

import '../../../core/style/theme_style.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepo weatherRepo;
  WeatherCubit({required this.weatherRepo}) : super(WeatherInitial());

  CurrentWeatherData? mycurrentweather;

  List<FiveDaysData> fivedaysweatherlist = [];



  void getCurrentWeatherData()async{
    print('current*****');
    emit(WeatherLoading());
    final data=await weatherRepo.getCurrentData();
    print('current***$data**');
    data.fold((failure) => emit(MyPostsGettingAllDataFailedState(failure.errorMsg)),
            (mycurrentweather) {
              print('from blocc${mycurrentweather.toString()}');
                this.mycurrentweather=mycurrentweather;
                emit(MyCurrentGetAllPostsSuccessfullyState(mycurrentweather));
            } );
    
  }
  void getFiveDaysWeatherData()async{
    emit(WeatherLoading());
    final either = await weatherRepo.getFiveDaysList();
    either.fold(
            (failure) => emit(MyPostsGettingAllDataFailedState(failure.errorMsg)),
            (weathers) {
          this.fivedaysweatherlist =weathers ;
          print('from blocc2${fivedaysweatherlist.toString()}');
          emit(FiveDaysGetAllPostsSuccessfullyState(weathers));
        });
  }





}
