import 'dart:math';
import 'package:flutter/material.dart';

class ChipWidget extends StatefulWidget {
  final List<String> values;

  const ChipWidget({Key? key, required this.values}) : super(key: key);

  @override
  _ChipWidgetState createState() => _ChipWidgetState();
}

class _ChipWidgetState extends State<ChipWidget> {
  Color nextColor(colors) {
    Color color = colors[Random().nextInt(colors.length)];
    colors.remove(color);
    return color;
  }

  @override
  Widget build(BuildContext context) {
    List colors = [Colors.red, Colors.green, Colors.yellow, Colors.blue];
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:
        widget.values.map(
              (item) => Chip(
            backgroundColor: nextColor(colors),
            label: Text(item, style: const TextStyle(color: Colors.white),),
          ),
        ).toList(),
      ),
    );
  }
}