import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map dataFromWorldTimeClass = {};
  @override
  Widget build(BuildContext context) {
    
    //! fix: error;
    dataFromWorldTimeClass = ModalRoute.of(context)!.settings.arguments as Map;
    print(dataFromWorldTimeClass);
    //WorldTime dataFromWorldTimeClass = WorldTime(location: data['location'], flag: data['flag'], url: data['url']);
    //print(dataFromWorldTimeClass);
    return Scaffold(
      body: Column(
        children: <Widget>[
          TextButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, '/location');
            },
            icon: const Icon(Icons.edit_location),
            label: const Text('Edit location'),
          ),
          const SizedBox(height: 20.0),
          /*Row(
            children: <Widget> [
              Text(dataFromWorldTimeClass.time!),
            ],
          )*/
        ],
      ),
    );
  }
}
