import 'dart:convert';

import 'package:flutter/services.dart';

Future<Film> fetchFilm(String title) async {
  final String response = await rootBundle.loadString('json/test.json');
  Map<String, dynamic> json = await jsonDecode(response);
  //developer.log(json.toString());
  Film film = Film.fromJson(json);
  film.trailer = Trailer(youtubeId: '8hYlB38asDY');
  //developer.log("Film => " + film.toString());
  final String responseReviews = await rootBundle.loadString('json/tt0371746_reviews.json');
  Map<String, dynamic> jsonReviews = await jsonDecode(responseReviews);
  List<Review> reviews = [];
  jsonReviews["items"].map((i) => Review.fromJson(i)).forEach((e) => reviews.add(e));
  film.reviews = reviews;
  final String responseMetacritics = await rootBundle.loadString('json/tt0371746_metacritics.json');
  Map<String, dynamic> jsonMetacritics = await jsonDecode(responseMetacritics);
  List<MetacriticReview> metacriticsReviews = [];
  jsonMetacritics["items"].map((i) => MetacriticReview.fromJson(i)).forEach((e) => metacriticsReviews.add(e));
  film.metacriticsReviews = metacriticsReviews;

  final String responseNm = await rootBundle.loadString('json/nm0269463.json');
  Map<String, dynamic> jsonNm = await jsonDecode(responseNm);
  film.filmCrew[0].image = jsonNm['image'];

  return film;
  /*final filmResponse = await http.get(Uri.parse('https://imdb-api.com/en/API/SearchTitle/k_d439be7p/' + title));
  if(filmResponse.statusCode == 200) {
    Map<String, dynamic> json = jsonDecode(filmResponse.body);
    developer.log(json.toString());
    String id = json['results'][0]['id'];
    developer.log("Id Imdb du film => " + id);
    final response = await http.get(Uri.parse('https://imdb-api.com/en/API/Title/k_d439be7p/' + id + "/Ratings,"));
    //developer.log("Envoi des commandes titles et trailer");
    if(response.statusCode == 200) {
      Map<String, dynamic> filmJson = jsonDecode(response.body);
      //developer.log("--Film--");
      //developer.log(filmJson.toString());
      Film film = Film.fromJson(filmJson);
      //developer.log('f => ' + film.toString());
      final trailerResponse = await http.get(Uri.parse('https://imdb-api.com/en/API/YouTubeTrailer/k_d439be7p/' + id));
      int code = trailerResponse.statusCode;
      //developer.log('response : ' + code.toString());
      if(code == 200)  {
        Map<String, dynamic> trailerJson = jsonDecode(trailerResponse.body);
        //developer.log("--Trailer--");
        //developer.log(trailerJson.toString());
        film.trailer = Trailer.fromJson(trailerJson);
      }
      developer.log("Film => " + film.toString());
      return film;
    } else {
      throw Exception('Failed to load Film');
    }
  } else {
    throw Exception('Failed to load Film');
  }*/
}

class Trailer{
  final String youtubeId;

  Trailer({
    required this.youtubeId,
  });

  factory Trailer.fromJson(Map<String, dynamic> json) {
    return Trailer(
      youtubeId: json['videoId'],
    );
  }
}

class Film {
  final String title;
  final String date;
  final String duration;
  late Trailer trailer;
  final List<String> genres;
  final double imdbRating;
  final int imDbRatingVotes;
  final int metacriticRating;
  final int tomatoRating;
  final List<Actor> actors;
  final List<Person> filmCrew;
  late List<Review> reviews;
  late List<MetacriticReview> metacriticsReviews;

  Film({
    required this.title,
    required this.date,
    required this.duration,
    required this.genres,
    required this.imdbRating,
    required this.imDbRatingVotes,
    required this.metacriticRating,
    required this.tomatoRating,
    required this.actors,
    required this.filmCrew,
  });

  factory Film.fromJson(Map<String, dynamic> json) {
    List<String> genres = [];
    json['genreList'].map((i) => i['value'] as String).forEach((e) => genres.add(e));
    //json['genreList'].map((i) => i['value'] as String).toList();
    //json['genreList'].map((i) => i['value']).forEach((e) => genres.add(e));
    //developer.log('actors => ' + json['actorList'].toString());
    //List<Actor> actors = [];
    var list = json['actorList'];
    List<Actor> actors = [];
    list.map((i) => Actor.fromJson(i)).forEach((e) => actors.add(e));
    //actors = json['actorList'].map((i) => Actor.fromJson(i)).forEach((e) => actors.add(e));
    //developer.log("test : " + actors.toString());
    List<Person> filmCrew = [];
    json['directorList'].map((i) => Person.fromJson(i, "Director")).forEach((e) => filmCrew.add(e));
    json['writerList'].map((i) => Person.fromJson(i, "Writer")).forEach((e) => filmCrew.add(e));

    return Film(
      title: json['title'],
      date: json['releaseDate'],
      duration: json['runtimeStr'],
      //genres: json['genreList'].map((i) => i['value'] as String).toList(),
      genres: genres,
      imdbRating: double.parse(json['imDbRating']),
      imDbRatingVotes: int.parse(json['imDbRatingVotes']),
      metacriticRating: int.parse(json['metacriticRating']== '' ? '0' : json['metacriticRating']),
      tomatoRating: int.parse(json['ratings']['rottenTomatoes'] == '' ? '0' : json['ratings']['rottenTomatoes']),
      actors: actors,
      filmCrew: filmCrew,
    );
  }

  @override
  String toString() {
    return 'Film{title: $title, date: $date, duration: $duration, trailer: $trailer, genres: $genres, imdbRating: $imdbRating, imDbRatingVotes: $imDbRatingVotes, metacriticRating: $metacriticRating, tomatoRating: $tomatoRating, actors: $actors, crew: $filmCrew}';
  }
}

class Actor {
  final String name;
  final String role;
  final String image;

  Actor({
    required this.name,
    required this.role,
    required this.image,
  });

  factory Actor.fromJson(Map<String, dynamic> json) {
    return Actor(
      name: json['name'],
      role: json['asCharacter'],
      image: json['image'],
    );
  }

  @override
  String toString() {
    return 'Actor{name: $name, role: $role, image: $image}';
  }
}

class Person {
  final String id;
  final String name;
  final String job;
  late String image;

  Person({
    required this.id,
    required this.name,
    required this.job,
    this.image = "https://cdn.webshopapp.com/shops/70489/files/362433541/600x600x2/the-legend-of-zelda-link-canvas-40x40cm.jpg",
  });

  factory Person.fromJson(Map<String, dynamic> json, String job) {
    return Person(
      id: json['id'],
      name: json['name'],
      job : job,
    );
  }

  @override
  String toString() {
    return 'Actor{id: $id, name: $name, job: $job}';
  }
}

class Review {
  final String rate;
  final String title;
  final String content;

  Review ({
    required this.rate,
    required this.title,
    this.content = "",
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    if(json["content"] == null) {
      return Review(rate: "", title: "");
    }
    return Review(rate: json["rate"], title: json["title"], content: json["content"]);
  }

  @override
  String toString() {
    return 'Review{rate: $rate, title: $title, content: $content}';
  }

}

class MetacriticReview {
  final String publisher;
  final String rate;
  final String content;

  MetacriticReview  ({
    required this.publisher,
    required this.rate,
    required this.content,
  });

  factory MetacriticReview.fromJson(Map<String, dynamic> json) {
    return MetacriticReview(rate: json["rate"], content: json["content"], publisher: json['publisher']);
  }

}
