import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {

  String location; //location name for UI
  late String time; //the time in that location
  String flag; //url to an asset flag icon
  String url; //location url for api endpoint

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {

    try{
      //Make network request
      var apiUrl = Uri.https('worldtimeapi.org', '/api/timezones/$url');
      Response response = await get(apiUrl);
      Map data = jsonDecode(response.body);

      // Get properties from json
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);

      //create DateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      //print(now);

      // set time property
      time = now.toString();
    }
    catch (e){
      print('Error caught: $e');
      time = 'Could not get time data';
    }

  }
}