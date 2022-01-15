import 'package:flutter/material.dart';

import '../components/header.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  static const routeName = '/settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const WidgetAppBar(returnPage: false,),
      body: Column(
        children: [
          const Divider(height: 25,),
          const Text("Settings", style: TextStyle(fontSize: 30, color: Colors.white),),
          const Card(
            child: ListTile(
              leading: Icon(Icons.credit_card),
              title: Text('Amex ending in 2403'),
            ),
          ),
          Card(
            child: ListTile(
              title: const Text('Allows notifications'),
              trailing: Switch(
                value: true, onChanged: (bool value) {  },
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.credit_card),
              title: Text('Amex ending in 2403'),
              trailing: OutlinedButton(
                onPressed: () {  },
                child: Text("Read"),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(width: 1, color: Color(0xffDB162F)),
                ),
              ),
            ),
          )
        ],
      ),
      drawer: const WidgetDrawer(),
    );
  }
}
