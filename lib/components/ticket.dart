import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

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
    /**/
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: CustomPaint(
        //size: Size(200, (200*0.2777777777777778).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
        painter: RPSCustomPainter(),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          margin: const EdgeInsets.symmetric(horizontal: 16.0),
          color: const Color(0xFFDB162F),
          height: 120,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CachedNetworkImage(
                height: 100,
                width: 100,
                placeholder: (context, url) => const CircularProgressIndicator(),
                imageUrl: ticket.image,
                fit: BoxFit.fitHeight,
              ),
              Expanded(
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 0.0, 4.0, 0.0),
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
                    ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {

    Path path_0 = Path();
    path_0.moveTo(size.width*0.01111114,size.height);
    path_0.lineTo(size.width*0.9888889,size.height);
    path_0.cubicTo(size.width*0.9950250,size.height,size.width,size.height*0.9820910,size.width,size.height*0.9600000);
    path_0.lineTo(size.width,size.height*0.6500000);
    path_0.cubicTo(size.width,size.height*0.6500000,size.width*0.9736833,size.height*0.6500000,size.width*0.9736833,size.height*0.5000000);
    path_0.cubicTo(size.width*0.9736833,size.height*0.3500000,size.width,size.height*0.3500000,size.width,size.height*0.3500000);
    path_0.lineTo(size.width,size.height*0.04000000);
    path_0.cubicTo(size.width,size.height*0.01790860,size.width*0.9950250,0,size.width*0.9888889,0);
    path_0.lineTo(size.width*0.01111111,0);
    path_0.cubicTo(size.width*0.004974611,0,0,size.height*0.01790860,0,size.height*0.04000000);
    path_0.lineTo(0,size.height*0.3500000);
    path_0.cubicTo(0,size.height*0.3500000,size.width*0.02631578,size.height*0.3500000,size.width*0.02631578,size.height*0.5000000);
    path_0.cubicTo(size.width*0.02631578,size.height*0.6500000,0,size.height*0.6500000,0,size.height*0.6500000);
    path_0.lineTo(0,size.height*0.9600000);
    path_0.cubicTo(0,size.height*0.9820910,size.width*0.004974639,size.height,size.width*0.01111114,size.height);
    path_0.close();

    Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
    paint_0_fill.color = Color(0xffDB162F).withOpacity(1.0);
    canvas.drawPath(path_0,paint_0_fill);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
