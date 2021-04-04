import 'dart:ui';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    // in the build method this is where we receive the actual arguments  that we send over there and the way we do that by using
    // Modal route
   data = data.isNotEmpty ? data :  ModalRoute.of(context).settings.arguments; // so this is going to be tha arguments that we receive  in loading.dart file ,
    // so its going to return a map of data , and we could do is just  update now this data to be whatever comes back
    print(data);

    //set background
   String bgImage = data['isDayTime'] ? 'day.png' : 'night.png';
   Color bgColor = data['isDayTime'] ? Colors.blue : Colors.indigo[700];

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0,120.0,0,0),
            child: Column(
              children: <Widget>[
                FlatButton.icon(
                  onPressed: () async{
                   dynamic result = await Navigator.pushNamed(context, '/location');
                   setState(() {
                     data = {
                       'time' : result['time'],
                       'location' : result['location'],
                       'flag' : result['flag'],
                       'isDayTime' : result['isDayTime'],
                     };
                   });
                  },
                  icon: Icon(

                      Icons.edit_location,
                      color : Colors.grey[300],
                  ),
                  label: Text(
                      'Edit Location',
                    style: TextStyle(

                      color: Colors.grey[300],
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(data['location'],
                    style: TextStyle(
                      fontSize: 28.0,
                      letterSpacing: 2.0,
                      color: Colors.white,
                    ) ,
                    ),
                  ],

                ),

                SizedBox(height : 20.0),
                Text(
                data['time'],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 66.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ), // safe_area brings it down to the safe area and that's what widget does it moves the child of that widget down into a safe area on the screen where we can't actually see it not behind this little bar at top

    );
  }
}
