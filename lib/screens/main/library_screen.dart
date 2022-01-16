import 'package:cine_flash/components/cards.dart';
import 'package:cine_flash/models/filmCard.dart';
import 'package:cine_flash/screens/film/film_screen.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;

import '../../main.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({Key? key}) : super(key: key);

  @override
  _LibraryScreenState createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  final textController = TextEditingController();
  late Future<List<FilmCard>> _cards;
  late Future<List<FilmCard>> _cards2;


  @override
  void initState(){
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    textController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    _cards = fetchFilms();
    _cards2 = fetchFilms2();
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        children: [
          Column(
            children: [
              const Text("Library", style: TextStyle(fontSize: 40, color: Colors.white),),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Form(
                    key: _formKey,
                    child: TextFormField(
                      decoration: InputDecoration(
                        icon: IconButton(
                          icon: const Icon(Icons.search_outlined),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              //String id = await findFilm("Iron Man");
                              String id = "tt0371746";
                              Navigator.pushNamed(context, FilmScreen.routeName, arguments: ScreenArguments(id));
                            }
                          },
                        ),
                        hintText: 'Enter a search term',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      onFieldSubmitted: (value) async {
                        //String id = await findFilm("Iron Man");
                        String id = "tt0371746";
                        Navigator.pushNamed(context, FilmScreen.routeName, arguments: ScreenArguments(id));
                      },
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border:  Border.all(
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const Divider(height: 15,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Trending", style: TextStyle(fontSize: 30, color: Colors.white),),
                  const Divider(height: 25,),
                  Wrap(
                    runSpacing: 20,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("MARVEL", style: TextStyle(fontSize: 15, color: Colors.white,),),
                          FutureBuilder<List<FilmCard>>(
                            future: _cards,
                            builder: (BuildContext context, snapshot) {
                              if(snapshot.hasData) {
                                List<FilmCard>? cards = snapshot.data;
                                return SizedBox(
                                  height: 275,
                                  child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: cards!.length,
                                    itemBuilder: (BuildContext context, int index) {
                                      return LibraryFilmCard(filmCard: cards[index],);
                                    },
                                    separatorBuilder: (BuildContext context, int index) => const Divider(height: 10.0,),
                                  ),
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("STAR WARS", style: TextStyle(fontSize: 15, color: Colors.white),),
                          FutureBuilder<List<FilmCard>>(
                            future: _cards2,
                            builder: (BuildContext context, snapshot) {
                              if(snapshot.hasData) {
                                List<FilmCard>? cards = snapshot.data;
                                return SizedBox(
                                  height: 275,
                                  child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: cards!.length,
                                    itemBuilder: (BuildContext context, int index) {
                                      return LibraryFilmCard(filmCard: cards[index],);
                                      },
                                    separatorBuilder: (BuildContext context, int index) => const Divider(height: 10.0,),
                                  ),
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
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}