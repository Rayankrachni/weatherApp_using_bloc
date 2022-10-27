

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.indigoAccent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SpinKitFadingCircle(
          itemBuilder: (BuildContext context, int index) {
            return DecoratedBox(

            decoration: BoxDecoration(

            color: index.isEven ? Colors.white : Colors.white,),);},
            ),
          const SizedBox(height: 20,),
          const Text('Data is Loading ,Please wait ',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),)
        ],
      ),
    );
  }

}
