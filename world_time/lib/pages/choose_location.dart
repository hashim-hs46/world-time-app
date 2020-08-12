import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: 'Asia/Kolkata', location: 'Kolkata', flag: 'india.png'),
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.webp'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Berlin', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Egypt', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'South Korea', flag: 'southkorea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Indonesia', flag: 'indonesia.jpg'),
  ];

  void updateTime(index) async{
    WorldTime instance = locations[index];
    await instance.getTime();
    // navigate to home screen
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
        child: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index){
           return Card(
             child: ListTile(
               onTap: () {
                 updateTime(index);
               },
               title: Text(locations[index].location),
               leading: CircleAvatar(
                 backgroundImage: AssetImage('assets/${locations[index].flag}'),
               ),
             ),
           );
          }
        ),
      )
    );
  }
}
