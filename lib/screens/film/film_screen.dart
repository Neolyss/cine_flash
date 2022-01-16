import 'package:cine_flash/components/reviews.dart';
import 'package:cine_flash/screens/main/main_screens.dart';
import 'package:cine_flash/components/showing.dart';
import 'package:cine_flash/models/trailer.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../components/chips.dart';
import '../../components/ratings.dart';
import '../../components/scrolls.dart';
import '../../main.dart';
import '../../models/film.dart';
import '../../components/header.dart';
import 'dart:developer' as developer;

class FilmScreen extends StatelessWidget {
  const FilmScreen({Key? key}) : super(key: key);

  static const routeName = '/film';

  @override
  Widget build(BuildContext context) {
    ScreenArguments arg = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    developer.log(arg.title);
    return FilmView(idFilm: arg.title,);
  }
}

class FilmView extends StatefulWidget {
  const FilmView({Key? key, required this.idFilm}) : super(key: key);

  final String idFilm;

  @override
  _FilmViewState createState() => _FilmViewState();
}

class _FilmViewState extends State<FilmView> {
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
                      Row(
                        children: [
                          Text(date, style: const TextStyle(color: Colors.grey, fontSize: 20),),
                          const Text(" ⸱ ", style: TextStyle(color: Colors.grey, fontSize: 30)),
                          Text(time, style: const TextStyle(color: Colors.grey, fontSize: 20),),
                        ],
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
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

