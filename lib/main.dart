import 'package:flutter/material.dart';

void main() { runApp(MyApp());}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Choice _selectedOption = choices[0];

  void _select(Choice choice) {
    setState(() {
      _selectedOption = choice;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('PopupMenu Button Example'),
          actions: <Widget>[
            PopupMenuButton<Choice>(
              onSelected: _select,
              itemBuilder: (BuildContext context) {
                return choices.skip(0).map((Choice choice) {
                  return PopupMenuItem<Choice>(
                    value: choice,
                    child: Text(choice.name??""),
                  );
                }).toList();
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ChoiceCard(choice: _selectedOption),
        ),
      ),
    );
  }
}

class Choice {
   Choice({this.name, this.icon});
   String? name;
   IconData? icon;
}

 List<Choice> choices = <Choice>[
   Choice(name: 'Wi-Fi', icon: Icons.wifi),
   Choice(name: 'Bluetooth', icon: Icons.bluetooth),
   Choice(name: 'Battery', icon: Icons.battery_alert),
   Choice(name: 'Storage', icon: Icons.storage),
];

class ChoiceCard extends StatelessWidget {
   ChoiceCard({Key? key, this.choice}) : super(key: key);

   Choice? choice;

  @override
  Widget build(BuildContext context) {
    // final TextStyle textStyle = Theme.of(context).textTheme.headlineMedium;
    return Card(
      color: Colors.greenAccent,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(choice?.icon, size: 115.0, color:Colors.blue),
            Text(choice?.name??"", style: TextStyle(color: Colors.red)),
          ]
        ),
      ),
    );
  }
}