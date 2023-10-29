import 'package:flutter/material.dart';
import '../service/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  //Creating a list of different locations from the Worldtime class
  List<WorldTime> locations = [
    WorldTime(location: 'Nairobi, Kenya', flag: 'kenya.png', url: 'Africa/Nairobi'),
    WorldTime(location: 'Cairo, Egypt', flag: 'egypt.png', url: 'Africa/Cairo'),
    WorldTime(location: 'Johannesburg, SA', flag: 'sa.png', url: 'Africa/Johannesburg'),
    WorldTime(location: 'Casablanca, Morroco', flag: 'morroco.png', url: 'Africa/Casablanca'),
    WorldTime(location: 'Monrovia, Liberia', flag: 'liberia.png', url: 'Africa/Monrovia'),
    WorldTime(location: 'Abidjan, Cote dIvoire', flag: 'cote.png', url: 'Africa/Abidjan'),
    WorldTime(location: 'Juba, South Sudan', flag: 'sudan.png', url: 'Africa/Juba'),
    WorldTime(location: 'Windhoek, Namibia', flag: 'namibia.png', url: 'Africa/Windhoek'),
    WorldTime(location: 'Tunis, Tunisia', flag: 'tunisia.png', url: 'Africa/Tunis'),
  ];


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text('Choose a Location'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: (){},
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          }
      ),
    );
  }
}
