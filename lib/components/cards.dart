import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import '../models/filmCard.dart';
import '../screens/film/film_screen.dart';

class HistoryFilmCard extends StatefulWidget {
  const HistoryFilmCard({Key? key, required this.filmCard}) : super(key: key);

  final FilmCard filmCard;

  @override
  _HistoryFilmCardState createState() => _HistoryFilmCardState();
}

class _HistoryFilmCardState extends State<HistoryFilmCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      height: 125,
      child: Card(
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, FilmScreen.routeName, arguments: ScreenArguments(widget.filmCard.id));
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: const [
                BoxShadow(
                  offset: Offset(
                    2.0,
                    2.0,
                  ),
                  color: Color(0xffDB162F),
                  blurRadius: 2,
                  spreadRadius: 2,
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CachedNetworkImage(
                  placeholder: (context, url) => const CircularProgressIndicator(),
                  imageUrl: widget.filmCard.image,
                  fit: BoxFit.fitHeight,
                ),
                Text(widget.filmCard.title, textAlign: TextAlign.center, style: const TextStyle(fontSize: 20),),
                const Icon(Icons.arrow_forward_rounded, color: Colors.black,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LibraryFilmCard extends StatefulWidget {
  const LibraryFilmCard({Key? key, required this.filmCard}) : super(key: key);

  final FilmCard filmCard;

  @override
  _LibraryFilmCardState createState() => _LibraryFilmCardState();
}

class _LibraryFilmCardState extends State<LibraryFilmCard> {
  @override
  Widget build(BuildContext context) {
    FilmCard filmCard = widget.filmCard;
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, FilmScreen.routeName, arguments: ScreenArguments(widget.filmCard.id));
        },
        child: Container(
          width: 175,
          height: 300,
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                width: 175,
                height: 200,
                placeholder: (context, url) => const CircularProgressIndicator(),
                imageUrl: filmCard.image,
                fit: BoxFit.cover,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                height: 50,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(filmCard.title),
                    Text("${filmCard.imDbRating} / 10", style: const TextStyle(color: Colors.grey),),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
