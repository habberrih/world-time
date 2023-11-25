import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/date_time.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void getTime() async {
    const String uri = 'https://worldtimeapi.org/api/timezone/Africa/Tripoli';

    http.Response res = await http.get(Uri.parse(uri));
    Map data = jsonDecode(res.body);

    final dataObject = LocalDate(
      dateTime: data['datetime'],
      offset: data['utc_offset'].substring(1, 3),
      timeZone: data['timezone'],
    );

    DateTime now = dataObject.setTimeDate(dataObject.dateTime);

    now = now.add(Duration(hours: int.parse(dataObject.offset)));
    print(now);
  }

  @override
  void initState() {
    super.initState();
    getTime();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('loading screen'),
    );
  }
}
