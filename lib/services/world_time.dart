import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {

  String location; // location name for the UI
  String time; // the time in location
  String flag; // url to an asset flag icon
  String url; //Location URL for API endpoint

  void getTime() async {
    Response response = await get('http://worldtimeapi.org/api/timezone/Europe/London');
    Map data = jsonDecode(response.body);
    print(data);
    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1,3);
    print(datetime);
    print(offset);
    // DateTime object
    DateTime now = DateTime.parse(datetime);
    print(now);
    now = now.add(Duration(hours:int.parse(offset)));
    print(now);

  }

}