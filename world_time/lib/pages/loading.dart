import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}


class _LoadingState extends State<Loading> with SingleTickerProviderStateMixin {
  String time = 'loading';
  AnimationController controller;

  void setWorldTime() async {
    WorldTime instance = WorldTime(location: 'Kolkata', flag: 'inda.png', url: 'Asia/Kolkata');
    await instance.getTime();
    Navigator.pushReplacementNamed  (context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 4000));
    setWorldTime();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitCubeGrid(
          color: Colors.black,
          size: 50.0,
          controller: controller,
        ),

      ),
    );
  }
}
