import 'dart:convert';
import 'package:flutter/services.dart';
import 'dart:developer' as developer;

Future<List<FilmCard>> fetchHistory() async {
  final String response = await rootBundle.loadString('json/films.json');
  Map<String, dynamic> json = await jsonDecode(response);
  List<FilmCard> cards = [];
  json["films"].map((i) => FilmCard.fromJson(i)).forEach((e) => cards.add(e));
  return cards;
}

Future<List<FilmCard>> fetchFilms() async {
  final String response = await rootBundle.loadString('json/marvel.json');
  Map<String, dynamic> json = await jsonDecode(response);
  List<FilmCard> cards = [];
  json["results"].map((i) => FilmCard.fromJson(i)).forEach((e) => cards.add(e));
  return cards;
}

Future<List<FilmCard>> fetchFilms2() async {
  final String response = await rootBundle.loadString('json/starWars.json');
  Map<String, dynamic> json = await jsonDecode(response);
  List<FilmCard> cards = [];
  json["results"].map((i) => FilmCard.fromJson(i)).forEach((e) => cards.add(e));
  return cards;
}

class FilmCard {
  final String id;
  final String title;
  final String image;
  final String imDbRating;

  FilmCard({
    required this.id,
    required this.title,
    required this.image,
    required this.imDbRating,
  });

  factory FilmCard.fromJson(Map<String, dynamic> json) {
    return FilmCard(
        id: json["id"],
        title: json["title"],
        image: json["image"],
        imDbRating: json["imDbRating"] ?? "None",
    );
  }

  @override
  String toString() {
    return 'FilmCard{id: $id, title: $title, image: $image, imDbRating: $imDbRating}';
  }
}