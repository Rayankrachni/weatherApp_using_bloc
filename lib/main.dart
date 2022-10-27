import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weatherapp_usingbloc/features/business_logic/cubit/weather_cubit.dart';
import '../core/dependency_inection/di.dart' as di;
import 'core/network/remote_network/dio_helper.dart';

import 'features/business_logic/cubit/them_cubit/theme_cubit.dart';

import 'features/data/theme_Repo.dart';
import 'features/presentation/screen/homescreen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final themeRepository = ThemeRepository(
      sharedPreferences: await SharedPreferences.getInstance(),);
  DioHelper.int();
  di.init();

  runApp( MyApp(themeRepository: themeRepository));
}






class MyApp extends StatelessWidget {


final ThemeRepository themeRepository;
  const MyApp({required this.themeRepository,super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
     BlocProvider<WeatherCubit>(
     create: (context) => di.get<WeatherCubit>(),),
      BlocProvider<ThemeCubit>(
        create: (context) => di.get<ThemeCubit>()..getCurrentTheme(),),

    ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
         primaryColor: Colors.white
        ),
        home: HomeScreen(),
      ),
    );
  }
}


