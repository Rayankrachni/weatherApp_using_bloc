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


  List<CurrentWeatherData>? mycurrentweather;


  List<FiveDaysData> fivedaysweatherlist = [];



  void getCurrentWeatherData()async{
    print('current*****');
    emit(WeatherLoading());
    final data=await weatherRepo.get48Willaya();
    print('current***$data**');
    data.fold((failure) => emit(MyPostsGettingAllDataFailedState(failure.errorMsg)),
            (mycurrentweather) {
              print('from blocc${mycurrentweather.toString()}');
                this.mycurrentweather=mycurrentweather;
                emit(MyCurrentGetAllPostsSuccessfullyState(mycurrentweather));
            } );
    
  }
  void getFiveDaysWeatherData()async{
    print('-----getFiveDaysWeatherData----');
    emit(WeatherLoading());
    final either = await weatherRepo.getFiveDaysList();
    print('-----5true----$either');
    either.fold(
            (failure) => emit(MyPostsGettingAllDataFailedState(failure.errorMsg)),
            (weathers) {
              print('-----5true----');
          this.fivedaysweatherlist =weathers ;
          print('from blocc2${fivedaysweatherlist.toString()}');
          emit(FiveDaysGetAllPostsSuccessfullyState(weathers));
        });
  }





}
