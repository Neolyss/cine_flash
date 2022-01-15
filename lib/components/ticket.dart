import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/ticket.dart';

class TicketView extends StatefulWidget {
  const TicketView({Key? key, required this.ticket}) : super(key: key);

  final Ticket ticket;

  @override
  _TicketViewState createState() => _TicketViewState();
}

class _TicketViewState extends State<TicketView> {
  @override
  Widget build(BuildContext context) {
    final Ticket ticket = widget.ticket;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      color: const Color(0xFFDB162F),
      height: 120,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(ticket.image)),
            ),
          ),
          Expanded(
            child: Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 0.0, 32.0, 0.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(ticket.title, style: const TextStyle(color: Colors.white),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(ticket.date, style: const TextStyle(color: Colors.white),),
                        const Padding(padding: EdgeInsets.symmetric(horizontal: 16.0)),
                        Text(ticket.hour, style: const TextStyle(color: Colors.white),),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(ticket.theater, style: const TextStyle(color: Colors.white),),
                        Text(ticket.room, style: const TextStyle(color: Colors.white),),
                        Text(ticket.version, style: const TextStyle(color: Colors.white),),
                      ],
                    ),
                  ],
                )
            ),
          ),
        ],
      ),
    );

  }
}
