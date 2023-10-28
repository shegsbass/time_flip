import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void getData() async {

    //Make network request
    var url = Uri.https('worldtimeapi.org', '/api/timezone/africa/lagos');
    Response response = await get(url);

    Map data = jsonDecode(response.body);
    //print (data);

    // Get properties from json
    String datetime = data['datetime'];
    int dayOfTheWeek = data['day_of_week'];
    String offset = data['utc_offset'].substring(1,3);
    print(datetime);
    //print(offset);
    //print(dayOfTheWeek);

    //create DateTime object
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));
    print(now);

  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Text(
          'Loading'
        ),
      ),
    );
  }
}
