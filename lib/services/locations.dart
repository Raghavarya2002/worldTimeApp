import 'package:worldtimeapp/services/world_time.dart';

class Locations {
  static final Locations _locations = Locations._internal();

  factory Locations() => _locations;

  Locations._internal();

  List<WorldTime> _worldTimes = [
    WorldTime(
      url: 'Europe/London',
      location: 'London',
      flag: 'flags/uk.png',
      dayTimeBackground: 'backgrounds/london/day.jpg',
      nightTimeBackground: 'backgrounds/london/night.jpg',
    ),
    WorldTime(
      url: 'Europe/Berlin',
      location: 'Athens',
      flag: 'flags/greece.png',
      dayTimeBackground: 'backgrounds/athens/day.jpg',
      nightTimeBackground: 'backgrounds/athens/night.jpg',
    ),
    WorldTime(
      url: 'Africa/Cairo',
      location: 'Cairo',
      flag: 'flags/egypt.png',
      dayTimeBackground: 'backgrounds/cairo/day.jpg',
      nightTimeBackground: 'backgrounds/cairo/night.jpg',
    ),
    WorldTime(
      url: 'Africa/Nairobi',
      location: 'Nairobi',
      flag: 'flags/kenya.png',
      dayTimeBackground: 'backgrounds/nairobi/day.jpg',
      nightTimeBackground: 'backgrounds/nairobi/night.jpg',
    ),
    WorldTime(
      url: 'America/Chicago',
      location: 'Chicago',
      flag: 'flags/usa6.png',
      dayTimeBackground: 'backgrounds/chicago/day.jpg',
      nightTimeBackground: 'backgrounds/chicago/night.jpg',
    ),
    WorldTime(
      url: 'America/New_York',
      location: 'New York',
      flag: 'flags/usa6.png',
      dayTimeBackground: 'backgrounds/new_york/day.jpg',
      nightTimeBackground: 'backgrounds/new_york/night.jpg',
    ),
    WorldTime(
      url: 'Asia/Seoul',
      location: 'Seoul',
      flag: 'flags/south_korea.png',
      dayTimeBackground: 'backgrounds/seoul/day.jpg',
      nightTimeBackground: 'backgrounds/seoul/night.jpg',
    ),
    WorldTime(
      url: 'Asia/Jakarta',
      location: 'Jakarta',
      flag: 'flags/indonesia.png',
      dayTimeBackground: 'backgrounds/jakarta/day.jpg',
      nightTimeBackground: 'backgrounds/jakarta/night.jpg',
    ),
  ];

  WorldTime worldTime(int index) => _worldTimes[index];

  int get count => _worldTimes.length;
}
