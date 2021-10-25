import 'package:flutter/material.dart';
import 'package:worldtimeapp/services/locations.dart';
import 'package:worldtimeapp/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  Locations locations = Locations();

  void updateTime(index) async {
    WorldTime instance = locations.worldTime(index);
    await instance.getTime();

    // navigate to the home screen
    Navigator.pop(context, instance.homeData);
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
      body: ListView.builder(
          // this list of view builder will use this item build item function now foe every single item inside this list
          // so it'll cycle through the list and it'll return a  widget template or widget tree for each item in this list
          itemCount: locations.count,
          itemBuilder: (context, index) {
            WorldTime worldTime = locations.worldTime(index);
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                    print(worldTime.location);
                  },
                  title: Text(worldTime.location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${worldTime.flag}'),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
