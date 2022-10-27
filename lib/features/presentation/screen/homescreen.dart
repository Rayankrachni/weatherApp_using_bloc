

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp_usingbloc/features/presentation/widgets/detail.dart';
import 'package:weatherapp_usingbloc/features/presentation/widgets/item.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:weatherapp_usingbloc/features/presentation/widgets/loading.dart';
import 'package:weatherapp_usingbloc/features/presentation/widgets/my_chart.dart';
import '../../business_logic/cubit/weather_cubit.dart';
import '../../data/model/currentweatherdata.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
//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
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController? searchCity;
  @override
  void initState() {
    // TODO: implement initState
    searchCity= TextEditingController();
    super.initState();
    BlocProvider.of<WeatherCubit>(context).getCurrentWeatherData();
  // BlocProvider.of<WeatherCubit>(context).getFiveDaysWeatherData();

  }
  @override
  Widget build(BuildContext context) {
    List<CurrentWeatherData>? weth;
    List<CurrentWeatherData> filtredList=[];


    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return  Scaffold(
     resizeToAvoidBottomInset: false,
      body:  BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state){
          if(state is WeatherLoading){
            return Loading();
          }
          else
          { if(state is MyCurrentGetAllPostsSuccessfullyState)
          {
            weth=(state).weather;
           // listCountriesWeather=get5days(weth!);
            print('length ${weth!.length}');

            print(weth![0].main!.temp);
            print(weth![0].weather![0].description);
            print(weth![0].weather![0].main);
            print(weth![0].weather![0].icon);
            print(weth![0].visibility);
            print(weth![0].coord!.lat);
            print(weth![0].coord!.lon);
            print(weth![0].wind!.deg);
            print(weth![0].wind!.speed);
            print(weth![0].clouds!.all);
            print(weth![0].cod);
            print(weth![0].sys!.country);
            print(weth![0].sys!.sunrise);
            print(weth![0].sys!.sunset);
            print(weth![0].sys!.type);
            print('min: ${(weth![0].main!.tempMin! - 273.15).round().toString()}\u2103 / max: ${(weth![0].main!
                .tempMax
            !- 273.15).round().toString()}\u2103');
            print( '${(weth![0].main!.temp! - 273.15).round().toString()}\u2103',);

            return

                Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[


                      Stack(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(bottom: 20.0),
                              alignment: Alignment.topCenter,
                              height:250.0,
                              decoration: const BoxDecoration(

                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.elliptical(30,8),
                                  bottomRight: Radius.elliptical(30,8),
                                ),
                                color:Colors.blueAccent,
                              ),

                              //child: Image.asset("assets/bgImage.jpg"),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 40,left: 22,right: 18,),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text('Weather\'s Today',style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 18,fontWeight: FontWeight.bold,fontFamily: 'Merriweather'),),
                                  IconButton(onPressed: (){
                                    // ThemeServices().changeThemeMode();
                                  }, icon: Icon(Icons.dark_mode,color: Colors.white)),

                                ],
                              ),
                            ),

                            Container(
                              //color: Colors.white,
                              width: width,
                              padding: const EdgeInsets.only(top: 90, left: 20, right: 20),
                              child: TextField(
                                style:const TextStyle(color: Colors.black),
                                controller: searchCity,
                                onChanged: (value){
                                  setState(() {
                                    filtredList=weth!.where((cities)=>cities.name!.toLowerCase().startsWith(value)).toList();

                                  });

                                },
                                decoration: InputDecoration(

                                  contentPadding:const EdgeInsets.only(left: 20.0,right: 20),
                                  enabledBorder:const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                  ),
                                  hintText: 'Search',
                                  hintStyle:const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14.0
                                  ),
                                  fillColor:Theme.of(context).primaryColor,
                                  filled: true,
                                  suffixIcon:const Icon(
                                    Icons.search,
                                    size: 25.0,
                                    color: Colors.grey,
                                  ),

                                ),
                                //onSubmitted :
                              ),
                            ),
                            CurrentCityDetail(weath: weth![0],),]),

                      //SizedBox(height: 10,),
                      const Padding(
                        padding:  EdgeInsets.only(left: 20.0,top: 25,bottom: 5),
                        child: Text('Other Cities',style:TextStyle(color: Colors.black)),
                      ),
                      Expanded(child:
                        ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount:searchCity!.text.isEmpty? weth!.length:filtredList.length,
                            itemBuilder: (BuildContext context,int index){
                              return ItemOfFiveDay(fivedays: searchCity!.text.isEmpty?weth![index]:filtredList[index],);

                              //
                            }),
                      ) ,
                      const SizedBox(height: 5),
                      const Divider(endIndent: 20,indent: 20,thickness: 3,),
                      MyChart()

                    ]

            );

          }

          }
          return Text('empty data');






        },
      ),


    );
  }

  List<CurrentWeatherData> get5days(List<CurrentWeatherData> fullList){

    List<CurrentWeatherData> fewCountries=[];
    for(int i=0;i<10;i++){
      fewCountries.add(fullList[i]);
      print('gett 555${fullList[i]}');
    }
    return fullList;
  }
}
