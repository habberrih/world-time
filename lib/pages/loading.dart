import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_time/pages/home_page.dart';

import '../services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWorldTime() async {
    WorldTime worldTime =
        WorldTime(location: 'Libya', flag: 'assets', url: 'Africa/Tripoli');
    String? time = await worldTime.getTime();

    if (!context.mounted) return;

    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => HomePage(
                flag: worldTime.flag,
                location: worldTime.location,
                isDayTime: worldTime.isDayTime!,
                time: time!,
              )),
    );
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
      body: const Center(
        child: SpinKitFadingCube(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
