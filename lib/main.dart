import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp_usingbloc/features/business_logic/cubit/weather_cubit.dart';
import '../core/dependency_inection/di.dart' as di;
import 'core/network/remote_network/dio_helper.dart';
import 'features/presentation/screen/homescreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  DioHelper.int();
  di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<WeatherCubit>(
      create: (context) => di.get<WeatherCubit>(),

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


