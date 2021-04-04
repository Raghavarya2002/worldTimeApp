import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:worldtimeapp/services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {



  void setupWorldTime() async{
    WorldTime instance = WorldTime(location: 'Berlin' , flag: 'India.png' , url: 'Europe/Berlin');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home' , arguments: { //  third parameter is argument which is basically a name parameter
    //  , which is a map & this map is  going to be a set value key pairs that we can pass through into the widget or the screen that we route
    // to which is the home screen , so these value key pairs are going to  basically what we want to  send to that next route
    // so we want to send a few different properties we want to send the location

      'location': instance.location,
      'flag': instance.flag,
      'time' : instance.time,
      'isDayTime' : instance.isDayTime,



    });

  }





  @override
  void initState() {

    super.initState();

    setupWorldTime();


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitRotatingCircle(
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );
  }
}
