import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{

  String location; // location name for ui
  String time; //  the time in that location
  String flag; // url to an asset  flag icon
  String url; // location url for api endpoints
  bool isDayTime; // true or false if day or not

  WorldTime({this.location , this.flag , this.url});


  Future<void> getTime() async{ // future is a temporary  placeholder value until the function is complete

    try{
      // make the request
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      // print(data);

      // get properties from the data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);
      // print(datetime);
      // print(offset);

      //create datetime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      // set the time property
      isDayTime = now.hour > 6 && now.hour < 20 ? true : false ;
      time = DateFormat.jm().format(now);
    }
    catch(e){

      print('caught error : $e');
      print('could not get the time data');


    }



  }


}

