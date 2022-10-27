
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MyChart extends StatefulWidget {
  const MyChart({Key? key}) : super(key: key);

  @override
  _MyChartState createState() => _MyChartState();
}

class _MyChartState extends State<MyChart> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0,right: 20,top: 10),
      child: SizedBox(
              height: 250,
              child:SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                  const Text('Forcast Next 5 Days',style:TextStyle(color: Colors.black)),
                  const SizedBox(height: 10,),
                  SizedBox(
                      height: 200,
                      child: SfCartesianChart())
                ],
                ),
              )),
    );

    /*;*/

  }

}
