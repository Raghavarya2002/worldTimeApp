import 'package:flutter/material.dart';
import 'package:worldtimeapp/pages/choose_location.dart';
import 'package:worldtimeapp/pages/home.dart';
import 'package:worldtimeapp/pages/loading.dart';
void main() {
  runApp(MaterialApp(
    initialRoute: '/' , // which of these is going to be the first route to load up when we open the app


    //this is going to be a map remember expects key value pairs now the key in this routes map are going to be the actual map themselves
    routes: {
      '/' : (context) => Loading(),
      '/home' : (context) => Home(),
      '/location' : (context) => ChooseLocation(),
    },

  ));
}


// maps in dart are like object literals in javascript or dictionaries in python
//they're basically just a set of key and value pairs
// Map is the data_type