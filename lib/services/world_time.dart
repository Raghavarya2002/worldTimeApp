import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; // location name for ui
  String time; //  the time in that location
  String flag; // url to an asset  flag icon
  String url; // location url for api endpoints
  bool isDayTime; // true or false if day or not
  String dayTimeBackground; // asset's URL to be used as day time backaground
  String
      nightTimeBackground; // asset's URL to be used as night time backaground

  WorldTime({
    this.location,
    this.flag,
    this.url,
    this.dayTimeBackground = 'backgrounds/day.png',
    this.nightTimeBackground = 'backgrounds/night.png',
  });

  Future<void> getTime() async {
    // future is a temporary  placeholder value until the function is complete

    try {
      // make the request
      Response response =
          await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      // print(data);

      // get properties from the data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      // print(datetime);
      // print(offset);

      //create datetime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      // set the time property
      isDayTime = _isDayTime(now);
      time = DateFormat.jm().format(now);
    } catch (e) {
      print('caught error : $e');
      print('could not get the time data');
    }
  }

  bool _isDayTime(DateTime dateTime) => dateTime.hour > 6 && dateTime.hour < 20;

  Map<String, dynamic> get homeData => {
        'location': location,
        'flag': flag,
        'isDayTime': isDayTime,
        'background': isDayTime ? dayTimeBackground : nightTimeBackground,
        'time': time
      };
}
