
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

abstract class ThemeServices{
  static ThemeData get lightTheme => ThemeData(
    scaffoldBackgroundColor: Colors.white,
    textTheme: ThemeData.light().textTheme.copyWith(
      bodyText1: const TextStyle(
        fontSize: 25,
        color: Colors.black,
      ),
      caption: const TextStyle(
        fontStyle: FontStyle.italic,
        fontSize: 15,
        color: Colors.black,
      ),
    ),
  );

  static ThemeData get darkTheme => ThemeData(
    scaffoldBackgroundColor: Colors.blueGrey.shade800,
    textTheme: ThemeData.dark().textTheme.copyWith(
      bodyText1: const TextStyle(
        fontSize: 25,
        color: Colors.white,
      ),
      caption: const TextStyle(
        fontStyle: FontStyle.italic,
        fontSize: 15,
        color: Colors.white,
      ),
    ),
  ); /* final lightTheme= ThemeData.light().copyWith(
    primaryColor: Colors.white,
    textTheme: const TextTheme(
      headline1:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),
      headline2:TextStyle(color: Colors.black54,fontWeight: FontWeight.bold,fontSize: 14),
      headline3:TextStyle(color: Colors.black54,fontSize: 13,fontWeight: FontWeight.w700,),
      headline4:TextStyle(color: Colors.black45,fontSize: 22,fontWeight: FontWeight.bold,fontFamily: 'Merriweather'),
      headline5:TextStyle(color: Colors.black45,fontSize: 17),
      headline6:TextStyle(color: Colors.black54,fontSize: 11,fontWeight: FontWeight.w700,),
    ),

    appBarTheme: const AppBarTheme(
        elevation: 0,
        color: Colors.white
    ),
    brightness: Brightness.light,


    dividerColor: Colors.black12,
  );
  final darkTheme= ThemeData.dark().copyWith(
    secondaryHeaderColor: Colors.white,

    appBarTheme:const AppBarTheme(
        elevation: 0,
        color:Colors.black12
    ),
    textTheme: const TextTheme(
      headline1:TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),
      headline2:TextStyle(color: Colors.white70,fontWeight: FontWeight.bold,fontSize: 14),
      headline3:TextStyle(color: Colors.white70,fontSize: 13),
      headline4:TextStyle(color: Colors.white70,fontSize: 22,fontWeight: FontWeight.bold,fontFamily: 'Merriweather'),
      headline5:TextStyle(color: Colors.white70,fontSize: 17),
      headline6:TextStyle(color: Colors.white70,fontSize: 12),
      // bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
    ),
    dividerColor: Colors.white54,
  );

  final _getStorage= GetStorage();
  final _darkThemeKey='isDarkMode';
  get darkThemeKey=>_darkThemeKey;
  void saveThemeData(bool isDarkMode){
    _getStorage.write(_darkThemeKey, isDarkMode);
  }
  bool isSaveThemeData(){
    return _getStorage.read(_darkThemeKey)?? false;
  }
  ThemeMode getThemeMode(){
    return isSaveThemeData() ? ThemeMode.light : ThemeMode.dark;
  }
  void changeThemeMode(){
    ThemeServices().isSaveThemeData()? ThemeMode.dark : ThemeMode.light;
    saveThemeData(!isSaveThemeData());
  }
*/

}