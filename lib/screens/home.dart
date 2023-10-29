import 'dart:math';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    data = (ModalRoute.of(context)?.settings.arguments as Map<dynamic, dynamic>?)!;

    //I'm defining the list of filenames that will display
    List<String> daytimeImages = ['daytime.jpg', 'daytime-2.jpg', 'daytime-3.jpg'];
    List<String> noontimeImages = ['noontime.jpg', 'noontime-2.jpg'];

    //Then, I'm randomly selecting the image from the list
    //by generating a random index for selecting an image
    Random random = Random();
    int randomIndex = random.nextInt(data['isDaytime'] ?? true ? daytimeImages.length : noontimeImages.length);


    //Select the image filename based on isDaytime and set background image
    String? bgImage = data['isDaytime'] ?? true ? daytimeImages[randomIndex] : noontimeImages[randomIndex];
    Color? bgColor = data['isDaytime'] ?? true ? Colors.blue : Colors.indigo[700];

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
            child: Column(
              children: [
                ElevatedButton.icon(
                    onPressed: (){
                      Navigator.pushNamed(context, '/location');
                    },
                    icon: const Icon(Icons.edit_location),
                    label: const Text(
                      'Edit Location'
                    ),
                ),

                SizedBox(height: 20.0),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          data['location'],
                          style: TextStyle(
                            fontSize: 24.0,
                            letterSpacing: 2.0,
                            color: Colors.white,
                          ),
                      ),
                      SizedBox(height: 20.0),

                      Text(
                          data['time'],
                          style: TextStyle(
                            fontSize: 66.0,
                            color: Colors.white,
                          ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
