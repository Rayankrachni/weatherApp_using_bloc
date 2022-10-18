

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp_usingbloc/features/presentation/widgets/detail.dart';
import 'package:weatherapp_usingbloc/features/presentation/widgets/item.dart';

import '../../business_logic/cubit/weather_cubit.dart';
import '../../data/model/currentweatherdata.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<WeatherCubit>(context).getCurrentWeatherData();
  }
  @override
  Widget build(BuildContext context) {
    CurrentWeatherData? weth;
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return  Scaffold(
      body:  BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state){
          if(state is WeatherLoading){
            return Text('loading data');
          }
          else
          { if(state is MyCurrentGetAllPostsSuccessfullyState)
          {
            weth=(state).weather;
            print(weth!.main!.temp);
            print(weth!.weather![0].description);
            print(weth!.weather![0].main);
            print(weth!.weather![0].icon);
            print(weth!.visibility);
            print(weth!.coord!.lat);
            print(weth!.coord!.lon);
            print(weth!.wind!.deg);
            print(weth!.wind!.speed);
            print(weth!.clouds!.all);
            print(weth!.cod);
            print(weth!.sys!.country);
            print(weth!.sys!.sunrise);
            print(weth!.sys!.sunset);
            print(weth!.sys!.type);
            print('min: ${(weth!.main!.tempMin! - 273.15).round().toString()}\u2103 / max: ${(weth!.main!
                .tempMax
            !- 273.15).round().toString()}\u2103');
            print( '${(weth!.main!.temp! - 273.15).round().toString()}\u2103',);

            return Column(
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
                        padding: const EdgeInsets.only(top: 90

                            , left: 20, right: 20),
                        child: TextField(
                          style:const TextStyle(color: Colors.black),
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
                      CurrentCityDetail(weath: weth,)
                    ],
                  ),
                  //SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0,top: 25,bottom: 5),
                    child: Text('Other Cities',style:TextStyle(color: Colors.black)),
                  ),
                  Expanded(child:
                  ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (BuildContext context,int index){
                        return ItemOfFiveDay();
                      }),
                  ) ,
                  const SizedBox(height: 10),
                  const Divider(endIndent: 20,indent: 20,thickness: 3,),
                  SizedBox(
                    height: height*0.31,
                    width: double.maxFinite,
                    //color: Theme.of(context).primaryColor,
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Forcast Next 5 Days',style:TextStyle(color: Colors.black)),
                            const SizedBox(height: 10,),
                            Center(child: Image.asset('assets/images/diag.png',scale: 0.9,))
                          ],
                        ),
                      ),
                    ),
                  )

                ]
            );
          }

          }
          return Text('empty data');






        },
      ),


    );
  }
}
