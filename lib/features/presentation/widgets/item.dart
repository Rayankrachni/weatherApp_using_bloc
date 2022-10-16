

import 'package:flutter/material.dart';

class ItemOfFiveDay extends StatefulWidget {
  const ItemOfFiveDay({Key? key}) : super(key: key);


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
            Text('Costansine',  style:TextStyle(color: Colors.black)),
            Image.asset('assets/images/icon-01.png',scale:6,),
            Text(' 20 C',style:TextStyle(color: Colors.black)),
            Text('My citu is seifisse',style:TextStyle(color: Colors.black)),
          ],


        ),
      ),
    );
  }
}
