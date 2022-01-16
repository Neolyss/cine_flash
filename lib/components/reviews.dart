import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/film.dart';

class ReviewsView extends StatefulWidget {
  final List<Review> reviews;
  final List<MetacriticReview> critics;

  const ReviewsView({Key? key, required this.reviews, required this.critics}) : super(key: key);

  @override
  _ReviewsViewState createState() => _ReviewsViewState();
}

class _ReviewsViewState extends State<ReviewsView> {
  @override
  Widget build(BuildContext context) {
    final List<Review> reviews = widget.reviews.sublist(0,9);
    final List<MetacriticReview> critics = widget.critics.sublist(0,9);
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.symmetric(vertical: 8.0),),
              Row (
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Reviews" , style: TextStyle(color: Colors.white),),
                  const Text("View all", style: TextStyle(color: Colors.grey),),
                ],
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 8.0),),
              SizedBox(
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: reviews.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ReviewView(
                      review: reviews[index],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.symmetric(vertical: 8.0),),
              Row (
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Critic Reviews" , style: TextStyle(color: Colors.white),),
                  const Text("View all", style: TextStyle(color: Colors.grey),),
                ],
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 8.0),),
              SizedBox(
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: reviews.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CriticView(
                      metacriticReview: critics[index],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ReviewView extends StatefulWidget {
  final Review review;

  const ReviewView({Key? key, required this.review}) : super(key: key);

  @override
  _ReviewViewState createState() => _ReviewViewState();
}

class _ReviewViewState extends State<ReviewView> {
  @override
  Widget build(BuildContext context) {
    Review review = widget.review;
    return Card(
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Color(0x77DB162F), width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        width: 300,
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              const Icon(Icons.star, color: Colors.yellow,),
              Padding(padding: EdgeInsets.symmetric(horizontal: 2.0)),
              Text("${review.rate}", style: TextStyle(color: Colors.white),),
            ],),
            const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
            Text(review.title, style: TextStyle(color: Colors.white),),
            const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
            Text(review.content, style: TextStyle(color: Colors.grey), maxLines: 5, overflow: TextOverflow.ellipsis,),
          ],
        ),
      ),
    );
  }
}

class CriticView extends StatefulWidget {
  final MetacriticReview metacriticReview;

  const CriticView({Key? key, required this.metacriticReview}) : super(key: key);

  @override
  _CriticViewState createState() => _CriticViewState();
}

class _CriticViewState extends State<CriticView> {
  @override
  Widget build(BuildContext context) {
    MetacriticReview review = widget.metacriticReview;
    return Card(
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Color(0x77DB162F), width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        width: 300,
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(review.publisher, style: TextStyle(color: Colors.white),),
            Row(children: [
              const Icon(Icons.star, color: Colors.yellow,),
              Padding(padding: EdgeInsets.symmetric(horizontal: 2.0)),
              Text("${review.rate}", style: TextStyle(color: Colors.white),),
            ],),
            Text(review.content, style: TextStyle(color: Colors.grey), maxLines: 5, overflow: TextOverflow.ellipsis,),
          ],
        ),
      ),
    );
  }
}

