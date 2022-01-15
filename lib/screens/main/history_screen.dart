import 'dart:convert';

import 'package:cine_flash/models/filmCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dart:developer' as developer;

import '../../components/cards.dart';
import '../../main.dart';
import '../film/film_screen.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  late Future<List<FilmCard>> _films;

  @override
  Widget build(BuildContext context) {
    _films = fetchHistory();
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          Column(
            children: [
              const Divider(height: 25,),
              const Text("History", style: TextStyle(fontSize: 30, color: Colors.white),),
              const Divider(height: 25,),
              FutureBuilder<List<FilmCard>>(
                  future: _films,
                  builder: (BuildContext context, snapshot) {
                    if(snapshot.hasData) {
                      List<FilmCard>? films = snapshot.data;
                      List<Widget> widgets = [];
                      films!.map((e) => HistoryFilmCard(filmCard: e,)).forEach((element) => widgets.add(element));
                      return Wrap(
                        runSpacing: 10,
                        children: widgets,
                      );
                      //return HistoryFilmCard(name:, link: films[index]["link"],);
                    }
                    else if(snapshot.hasError) {
                      return Text('${snapshot.error}');
                    } else {
                      return const CircularProgressIndicator();
                    }
                  }
              ),
              const Divider(height: 25,),
            ],
          )
        ],
      ),
    );
  }
}

