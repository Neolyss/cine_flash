import 'package:flutter/material.dart';

import '../components/header.dart';

class TicketsScreen extends StatelessWidget {
  const TicketsScreen({Key? key}) : super(key: key);

  static const routeName = '/tickets';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetAppBar(returnPage: false,),
      body: Column(
        children: const [
          Divider(height: 25,),
          Text("Tickets", style: TextStyle(fontSize: 30, color: Colors.white),),
        ],
      ),
      drawer: WidgetDrawer(),
    );
  }
}
