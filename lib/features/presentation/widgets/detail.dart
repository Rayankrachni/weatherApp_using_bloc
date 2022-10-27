import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';


import '../../data/model/currentweatherdata.dart';

class CurrentCityDetail extends StatefulWidget {
  CurrentWeatherData? weath;
  CurrentCityDetail({Key? key,required this.weath}) : super(key: key);


  @override
  _CurrentCityDetailState createState() => _CurrentCityDetailState();
}

class _CurrentCityDetailState extends State<CurrentCityDetail> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializeDateFormatting();

  }
  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now());
    return Container(
        margin: EdgeInsets.only(top: 150,left: 20,right: 20),
        height: 200,

        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius:   BorderRadius.all(Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                offset: const Offset(
                  2.0,
                  1.0,
                ),
                blurRadius: 5.0,
                spreadRadius: 2.0,
              ),
            ]
        ),
        child: Padding(
            padding: const EdgeInsets.only(top:20.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text('City: ${widget.weath!.name}',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
                  SizedBox(height: 7,),
                  Text('$formattedDate ',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),


                  //'wind ${widget.weath!.wind!.speed} m/s',
                  // Text('wind ${widget.weath!.wind!.speed} m/s',style:TextStyle(color: Colors.black)),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0,top: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:  [
                            Text(' ${widget.weath!.weather![0].description!}',style:TextStyle(color: Colors.black,fontSize: 15)),
                            SizedBox(height: 5,),

                            Text('${(widget.weath!.main!.temp! - 273.15).round().toString()}\u2103',style:TextStyle(color: Colors.black54,fontSize: 26,fontWeight: FontWeight.bold)),
                            SizedBox(height: 10,),
                            //Text(' Status: ${widget.weath!.weather![0].description!}',style:TextStyle(color: Colors.black,fontSize: 15)),
                            //SizedBox(height: 5,),
                            Text('wind: ${widget.weath!.wind!.speed} m/s',style:TextStyle(color: Colors.black)),
                            SizedBox(height: 5,),
                            Text('Min: ${(widget.weath!.main!.tempMin! - 273.15).round().toString()}\u2103 / Max: ${(widget.weath!.main!
                                .tempMax
                            !- 273.15).round().toString()}\u2103',style:TextStyle(color: Colors.black)),

                          ],
                        ),
                      ),
                      Image.asset('assets/images/icon-01.png',scale: 2.5,)
                    ],
                  )
                ],
              ),
            )
        ));

  }
}
