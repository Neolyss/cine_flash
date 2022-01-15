import 'package:flutter/material.dart';

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