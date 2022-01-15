import 'package:cine_flash/components/ticket.dart';
import 'package:cine_flash/models/ticket.dart';
import 'package:flutter/material.dart';

import '../components/header.dart';

class TicketsScreen extends StatelessWidget {
  const TicketsScreen({Key? key}) : super(key: key);

  static const routeName = '/tickets';

  @override
  Widget build(BuildContext context) {
    Future<List<Ticket>> tickets = fetchTickets();
    return Scaffold(
      appBar: WidgetAppBar(returnPage: false,),
      body: ListView(
        children: [
          Column(
            children: [
              Divider(height: 25,),
              Text("Tickets", style: TextStyle(fontSize: 30, color: Colors.white),),
              Divider(height: 25,),
              FutureBuilder<List<Ticket>>(
                  future: tickets,
                  builder: (context, snapshot) {
                    if(snapshot.hasData) {
                      List<Ticket>? ticketsData = snapshot.data;
                      List<Widget> widgets = [];
                      ticketsData?.forEach((e) => widgets.add(TicketView(ticket: e)));
                      return Wrap(
                        runSpacing: 25,
                        children: widgets
                      );
                    } else if(snapshot.hasError) {
                      return Text('${snapshot.error}');
                    } else {
                      return const CircularProgressIndicator();
                    }
                  }
              ),
            ],
          )
        ],
      ),
      drawer: WidgetDrawer(),
    );
  }
}
