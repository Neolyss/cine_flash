import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:cine_flash/reviews.dart';
import 'package:cine_flash/showing.dart';
import 'package:cine_flash/trailer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:http/http.dart' as http;
import 'film.dart';
import 'header.dart';
import 'main.dart';
import 'dart:developer' as developer;

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key}) : super(key: key);

  static const routeName = '/result';

  @override
  Widget build(BuildContext context) {
    return const Result();
  }
}

class Result extends StatefulWidget {
  const Result({Key? key}) : super(key: key);

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  late Future<Film> futureFilm;

  @override
  void initState(){
    super.initState();
  }

  SizedBox Space(double value) {
    return SizedBox(
      height: value,
    );
  }

  Divider Underline() {
    return const Divider(
      height: 20,
      thickness: 1,
      indent: 0,
      endIndent: 0,
      color: Colors.grey,
    );
  }

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    futureFilm = fetchFilm(args.title);
    return Scaffold(
      backgroundColor: const Color(0xFF0E1111),
      appBar: const WidgetAppBar(returnPage: true,),
      body: ListView(
        children: [
          Space(10),
          FutureBuilder<Film> (
            future: futureFilm,
            builder: (context, snapshot) {
              if(snapshot.hasData) {
                var inputFormat = DateFormat('yyyy-MM-dd');
                var outputFormat = DateFormat('dd LLLL yyyy');
                var date = outputFormat.format(inputFormat.parse(snapshot.data!.date));
                var timeDuration =DateFormat("h'h' m'mins'").parse(snapshot.data!.duration);
                var time = DateFormat("h'h'mm").format(timeDuration);
                return Column(
                  children: [
                    Center(
                      child: Text(snapshot.data!.title, style: TextStyle(color: Colors.white, fontSize: 30),),
                    ),
                    SizedBox(height: 5,),
                    Center(
                      child: Text(date + " ⸱ " + time, style: TextStyle(color: Colors.grey, fontSize: 20),),
                    ),
                    Space(10),
                    VideoWidget(youtubeId: snapshot.data!.trailer.youtubeId),
                    Space(5),
                    ChipWidget(values: snapshot.data!.genres),
                    Space(5),
                    RatingsWidget(
                      imdbRating: snapshot.data!.imdbRating.toString(),
                      imdbVotes: snapshot.data!.imDbRatingVotes.toString(),
                      metacritic: snapshot.data!.metacriticRating.toString(),
                      tomato: snapshot.data!.tomatoRating.toString(),
                    ),
                    Underline(),
                    const NextShowing(),
                    Underline(),
                    DefaultTabController(
                      length: 4, // length of tabs
                      initialIndex: 0,
                      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
                        Container(
                          child: TabBar(
                            labelColor: const Color(0xffDB162F),
                            unselectedLabelColor: Colors.white,
                            indicatorColor: const Color(0xffDB162F),
                            tabs: [
                              Tab(icon: Icon(Icons.calendar_today_outlined),text: 'SHOWING'),
                              Tab(icon: Icon(Icons.people), text: 'CASTING'),
                              Tab(icon: Icon(Icons.star), text: 'RATINGS'),
                              Tab(icon: Icon(Icons.menu_book_outlined), text: 'NEWS'),
                            ],),
                        ),
                        Container(
                          height: 400, //height of TabBarView
                          child: TabBarView(
                            children: <Widget>[
                              // 1
                              const NextShowings(),
                              // 2
                              Column(
                                children: [
                                  ActorScrollView(actors: snapshot.data!.actors),
                                  CrewScrollView(filmCrew: snapshot.data!.filmCrew),
                                ],
                              ),
                              // 3
                              ReviewsView(reviews: snapshot.data!.reviews, critics: snapshot.data!.metacriticsReviews,),
                              // 4
                              Container(
                                child: const Center(
                                  child: Text('Display Tab 4', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                      ),
                    )
                  ],
                );
              } else if(snapshot.hasError) {
                return Text('${snapshot.error}');
              } else {
                return const CircularProgressIndicator();
              }
            }
          ),
        ],
      ),
    );
  }
}

class ActorScrollView extends StatefulWidget {
  final List<Actor> actors;

  const ActorScrollView({Key? key, required this.actors}) : super(key: key);

  @override
  _ActorScrollViewState createState() => _ActorScrollViewState();
}

class _ActorScrollViewState extends State<ActorScrollView> {
  @override
  Widget build(BuildContext context) {
    List<Actor> actors = widget.actors;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.symmetric(vertical: 8.0),),
          const Text("Actors", style: TextStyle(color: Colors.white),),
          Padding(padding: EdgeInsets.symmetric(vertical: 8.0),),
          SizedBox(
            height: 70,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                Actor actor = actors[index];
                return Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      width: 56,
                      height: 56,
                      child: CircleAvatar(
                        radius: 56,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.network(
                            actor.image,
                            fit: BoxFit.cover,
                            width: 56,
                            height: 56,
                          ),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(actor.name, style: TextStyle(color: Colors
                            .white,),),
                        Text(actor.role, style: TextStyle(color: Colors
                            .grey,),),
                      ],
                    ),
                  ],
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
              const Padding(padding: EdgeInsets.symmetric(horizontal: 8.0)),
              itemCount: actors.length,
            ),
          ),
        ],
      ),
    );
  }
}

class CrewScrollView extends StatefulWidget {
  final List<Person> filmCrew;

  const CrewScrollView({Key? key, required this.filmCrew}) : super(key: key);

  @override
  _CrewScrollViewState createState() => _CrewScrollViewState();
}

class _CrewScrollViewState extends State<CrewScrollView> {
  @override
  Widget build(BuildContext context) {
    List<Person> filmCrew = widget.filmCrew;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.symmetric(vertical: 8.0),),
          const Text("Film Crew", style: TextStyle(color: Colors.white),),
          Padding(padding: EdgeInsets.symmetric(vertical: 8.0),),
          SizedBox(
            height: 70,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                Person person = filmCrew[index];
                return Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      width: 56,
                      height: 56,
                      child: CircleAvatar(
                        radius: 56,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.network(
                            person.image,
                            fit: BoxFit.cover,
                            width: 56,
                            height: 56,
                          ),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(person.name, style: TextStyle(color: Colors
                            .white,),),
                        Text(person.job, style: TextStyle(color: Colors
                            .grey,),),
                      ],
                    ),
                  ],
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
              const Padding(padding: EdgeInsets.symmetric(horizontal: 8.0)),
              itemCount: filmCrew.length,
            ),
          ),
        ],
      ),
    );
  }
}

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

class RatingsWidget extends StatefulWidget {
  final String imdbRating;
  final String imdbVotes;
  final String metacritic;
  final String tomato;

  const RatingsWidget({Key? key, required this.imdbRating, required this.imdbVotes, required this.metacritic, required this.tomato }) : super(key: key);

  @override
  _RatingsWidgetState createState() => _RatingsWidgetState();
}

class _RatingsWidgetState extends State<RatingsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child : Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(child:
            Container(
              height: MediaQuery.of(context).size.height  * 0.10,
              child: Column(
                children: [
                  const Expanded(flex: 1, child: Text("IMDB Rating", style: TextStyle(color: Colors.white, fontSize: 16),),),
                  Expanded(flex: 3, child: ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 4),
                    horizontalTitleGap: 3,
                    title: Text(widget.imdbRating + " / 10", style: TextStyle(color: Colors.white),),
                    subtitle: Text(widget.imdbVotes, style: TextStyle(color: Colors.grey),),
                    leading: Icon(Icons.favorite, color: Colors.red,),
                  ),),
                ],
              ),
            ),
          ),
          Expanded(child:
            Container(
              height: MediaQuery.of(context).size.height  * 0.10,
              child: Column(
                children: [
                  const Expanded(flex: 1, child: Text("MetaCritic Rating", style: TextStyle(color: Colors.white, fontSize: 16),),),
                  Expanded(flex: 3, child: ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 4),
                    horizontalTitleGap: 3,
                    title: Text(widget.metacritic, style: TextStyle(color: Colors.white),),
                    leading: Icon(Icons.movie_outlined, color: Colors.green,),
                  ),),
                ],
              ),
            ),
          ),
          Expanded(child:
            Container(
              height: MediaQuery.of(context).size.height * 0.10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Expanded(flex: 1, child: Text("Tomato Rating", style: TextStyle(color: Colors.white, fontSize: 16),),),
                  Expanded(
                    flex: 3,
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 4),
                      horizontalTitleGap: 3,
                      title: Text(widget.tomato, style: TextStyle(color: Colors.white),),
                      leading: Icon(Icons.event_note_outlined , color: Colors.red,),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

