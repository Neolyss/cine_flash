import 'package:flutter/material.dart';

import '../components/header.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  static const routeName = '/settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const WidgetAppBar(returnPage: false,),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Wrap(
          runSpacing: 25,
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.start,
          children: [
            const Text("Settings", style: TextStyle(fontSize: 30, color: Colors.white),),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Saved payment methods", style: TextStyle(color: Color(0xffDB162F)),),
                const Divider(height: 5,),
                const Card(
                  child: ListTile(
                    leading: Icon(Icons.credit_card),
                    title: Text('Amex ending in 2403'),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    OutlinedButton(
                      onPressed: () {  },
                      child: const Text("DELETE CARD"),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(width: 1, color: Color(0xffDB162F)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Notifications", style: TextStyle(color: Color(0xffDB162F)),),
                const Divider(height: 5,),
                Card(
                  child: ListTile(
                    title: const Text('Allows notifications'),
                    trailing: Switch(
                      value: true, onChanged: (bool value) {  },
                    ),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Saved payment methods", style: TextStyle(color: Color(0xffDB162F)),),
                const Divider(height: 5,),
                Card(
                  child: ListTile(
                    leading: const Icon(Icons.insert_drive_file_rounded),
                    title: const Text('RGPD'),
                    trailing: OutlinedButton(
                      onPressed: () {  },
                      child: const Text("READ"),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(width: 1, color: Color(0xffDB162F)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Data", style: TextStyle(color: Color(0xffDB162F)),),
                const Divider(height: 5,),
                Card(
                  child: ListTile(
                    leading: const Icon(Icons.clear),
                    title: const Text('Clear cache'),
                    trailing: OutlinedButton(
                      onPressed: () {  },
                      child: const Text("CLEAR"),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(width: 1, color: Color(0xffDB162F)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      drawer: const WidgetDrawer(),
    );
  }
}
