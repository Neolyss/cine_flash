import 'package:cine_flash/components/cards.dart';
import 'package:cine_flash/models/filmCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({Key? key}) : super(key: key);

  @override
  _LibraryScreenState createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  late Future<List<FilmCard>> _cards;
  late Future<List<FilmCard>> _cards2;

  @override
  Widget build(BuildContext context) {
    _cards = fetchFilms();
    _cards2 = fetchFilms2();
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: [
          Column(
            children: [
              const Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
              const Text("Library", style: TextStyle(fontSize: 40, color: Colors.white),),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.search_outlined),
                      hintText: 'Enter a search term',
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
              const Divider(height: 25,),
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
                          separatorBuilder: (BuildContext context, int index) => const Divider(height: 5.0,),
                        ),
                      );
                    } else if(snapshot.hasError) {
                      return Text('${snapshot.error}');
                    } else {
                      return const CircularProgressIndicator();
                    }
                  }
              ),
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
                            return Card(
                              child: Container(
                                width: 175,
                                height: 300,
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.network(cards[index].image, width: 175, height: 200, fit: BoxFit.cover),
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                      height: 50,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(cards[index].title),
                                          Text("${cards[index].imDbRating} / 10", style: TextStyle(color: Colors.grey),),
                                        ],
                                      ),
                                    )

                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) => const Divider(height: 5.0,),
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
    );
  }
}