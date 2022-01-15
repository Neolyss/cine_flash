import 'dart:convert';

import 'package:flutter/services.dart';

Future<List<Ticket>> fetchTickets() async {
  final String response = await rootBundle.loadString('json/filmTickets.json');
  Map<String, dynamic> json = await jsonDecode(response);
  List<Ticket> tickets = [];
  json["tickets"].map((i) => Ticket.fromJson(i)).forEach((e) => tickets.add(e));
  return tickets;
}

class Ticket {
  final String image;
  final String title;
  final String date;
  final String hour;
  final String theater;
  final String room;
  final String version;

  Ticket({
    required this.image,
    required this.title,
    required this.date,
    required this.hour,
    required this.theater,
    required this.room,
    required this.version,
  });

  factory Ticket.test() {
    return Ticket(image: "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQRldT4RKBlDSiPcwHAZbLAUNqsGCatYti-CLyeCxCsG9iADdMq", title: "title", date: "date", hour: "hour", theater: "theater", room: "room", version: "version");
  }

  factory Ticket.fromJson(Map<String, dynamic> json) {
    return Ticket(
        image: json["image"],
        title: json["title"],
        date: json["date"],
        hour: json["hour"],
        theater: json["theater"],
        room: json["room"],
        version: json["version"],
    );

  }

}

