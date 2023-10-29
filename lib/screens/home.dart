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

    //set background image
    String? bgImage = data['isDaytime'] ?? true ? 'daytime.jpg' : 'noontime.jpg';
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
