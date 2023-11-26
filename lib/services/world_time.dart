import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../models/date_time.dart';

class WorldTime {
  String location;
  String? time;
  String flag;
  String url;
  bool? isDayTime;

  WorldTime({
    required this.location,
    required this.flag,
    required this.url,
  });

  Future<void> getTime() async {
    try {
      String uri = 'https://worldtimeapi.org/api/timezone/$url';

      http.Response res = await http.get(Uri.parse(uri));
      Map data = jsonDecode(res.body);

      final dataObject = LocalDate(
        dateTime: data['datetime'],
        offset: data['utc_offset'].substring(1, 3), //* takes only the hours
        //timeZone: data['timezone'],
      );

      DateTime now = dataObject.setTimeDate(dataObject.dateTime);

      now = now.add(Duration(hours: int.parse(dataObject.offset)));
      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      time = 'Could not get time';
    }
  }
}
