

import 'package:flutter/material.dart';
import 'package:weatherapp_usingbloc/features/data/model/currentweatherdata.dart';

class ItemOfFiveDay extends StatefulWidget {
  CurrentWeatherData fivedays;
  ItemOfFiveDay({Key? key,required this.fivedays}) : super(key: key);


  @override
  _ItemOfFiveDayState createState() => _ItemOfFiveDayState();
}

class _ItemOfFiveDayState extends State<ItemOfFiveDay> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(top: 15.0,left: 20),

      child: SingleChildScrollView(
        child: Column(

          mainAxisSize: MainAxisSize.min,
          children: [
            Text(widget.fivedays.name!,  style:TextStyle(color: Colors.black)),
            Image.asset('assets/images/icon-01.png',scale:6,),
            Text('${(widget.fivedays.main!.temp! - 273.15).round().toString()}\u2103',style:TextStyle(color: Colors.black)),
            Text(widget.fivedays.weather![0].description!,style:TextStyle(color: Colors.black)),
           // SizedBox(height: 40,)

          ],


        ),
      ),
    );
  }
}
