import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:weatherapp_usingbloc/features/business_logic/cubit/weather_cubit.dart';
import 'package:weatherapp_usingbloc/features/data/Networkhelper/WeatherApi.dart';
import 'package:weatherapp_usingbloc/features/data/WeatherRepo/weather_repo.dart';

import '../core/network/check_network.dart';

import '../core/dependency_inection/di.dart' as main_di_container;


void init() {
  // TODO register BLoCs
 // main_di_container.get.registerFactory(() => PostsBloc(postsRepo: main_di_container.get()));

  //  TODO Uncomment to use Cubit as State-Management
  main_di_container.get.registerFactory(() => WeatherCubit(weatherRepo: main_di_container.get()));

  //ToDo Register Repos/
  main_di_container.get.registerLazySingleton<WeatherRepo>(() => WeatherRepoImpl(weatherApi: main_di_container.get(), networkInfo: main_di_container.get()));

  //ToDo Register APIS
  main_di_container.get
      .registerLazySingleton<WeatherApi>(() => WeatherApiwithDioImpl());

  //ToDo Register Core
  main_di_container.get.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(main_di_container.get()));

  //ToDo Register External Packages
  main_di_container.get
      .registerLazySingleton(() => InternetConnectionChecker());
}