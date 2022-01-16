import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../models/film.dart';

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
          const Padding(padding: EdgeInsets.symmetric(vertical: 8.0),),
          const Text("Actors", style: TextStyle(color: Colors.white),),
          const Padding(padding: EdgeInsets.symmetric(vertical: 8.0),),
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
                          child: CachedNetworkImage(
                            placeholder: (context, url) => const CircularProgressIndicator(),
                            imageUrl: actor.image,
                            width: 56,
                            height: 56,
                            fit: BoxFit.cover,
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
                          child: CachedNetworkImage(
                            placeholder: (context, url) => const CircularProgressIndicator(),
                            imageUrl: person.image,
                            width: 56,
                            height: 56,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(person.name, style: const TextStyle(color: Colors
                            .white,),),
                        Text(person.job, style: const TextStyle(color: Colors
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
