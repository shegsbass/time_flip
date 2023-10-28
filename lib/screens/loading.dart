import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

import 'package:time_flip/service/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  
  String currentTime = 'loading';

  Future<void> setupAfricaTime() async {
    WorldTime instance = WorldTime(location: 'Lagos, Nigeria', flag: 'nigeria.png', url: '/Africa/Lagos');
    await instance.getTime();
    print(instance.time);
    setState(() {
      currentTime = instance.time;
    });
  }

  @override
  void initState() {
    super.initState();
    setupAfricaTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Text(
          currentTime
        ),
      ),
    );
  }
}
