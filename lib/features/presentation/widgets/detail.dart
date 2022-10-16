



import 'package:flutter/material.dart';

class CurrentCityDetail extends StatefulWidget {
  const CurrentCityDetail({Key? key}) : super(key: key);


  @override
  _CurrentCityDetailState createState() => _CurrentCityDetailState();
}

class _CurrentCityDetailState extends State<CurrentCityDetail> {
  @override
  Widget build(BuildContext context) {
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
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                    Text('Costansine',style: TextStyle(color: Colors.black)),
                  SizedBox(height: 5,),
                  Text('City weather today',style:TextStyle(color: Colors.black)),
                  SizedBox(height: 20,),
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
                            Text('My citu is seifisse',style:TextStyle(color: Colors.black)),
                            SizedBox(height: 5,),
                            Text(' 20 C',style:TextStyle(color: Colors.black)),
                            SizedBox(height: 5,),
                            Text('Costansine',style:TextStyle(color: Colors.black)),

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
