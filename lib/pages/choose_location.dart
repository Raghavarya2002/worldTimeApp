import 'package:flutter/material.dart';
import 'package:worldtimeapp/services/world_time.dart';
class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [

    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa6.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa6.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),


  ];

  void updateTime(index) async {

    WorldTime instance = locations[index];
    await instance.getTime();

    // navigate to the home screen 
    Navigator.pop(context, {

      'location': instance.location,
      'flag': instance.flag,
      'time' : instance.time,
      'isDayTime' : instance.isDayTime,
    });

  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.green[500],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0, // to remove drop shadow
      ),
      body: ListView.builder( // this list of view builder will use this item build item function now foe every single item inside this list
        // so it'll cycle through the list and it'll return a  widget template or widget tree for each item in this list
        itemCount: locations.length,
        itemBuilder: (context , index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0 , horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: (){
                  updateTime(index);
                  print(locations[index].location);

                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),

            ),
          );
        }
      ),
    );
  }
}
