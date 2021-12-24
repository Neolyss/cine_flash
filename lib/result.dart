import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'header.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key}) : super(key: key);

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

  Container time(String hour, String version) {
    return Container(
        width: 150,
        height: 75,
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.white,
              width: 1,
            )
        ),
        child: Column (
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(hour, style: const TextStyle(color: Colors.white, fontSize: 16),),
            Text(version, style: const TextStyle(color: Colors.grey, fontSize: 14),),
          ],
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E1111),
      appBar: const WidgetAppBar(returnPage: true,),
      body: ListView(
        children: [
          Space(10),
          const Center(
            child: Text("Thor: le monde des ténèbres", style: TextStyle(color: Colors.white, fontSize: 30),),
          ),
          Space(5),
          const Center(
            child: Text("30 octobre 2013 ⸱ 1h52", style: TextStyle(color: Colors.grey, fontSize: 20),),
          ),
          Space(10),
          const VideoWidget(),
          Space(5),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Chip(
                  backgroundColor: Colors.blue,
                  label: Text('Tous public', style: TextStyle(color: Colors.white),),
                ),
                Chip(
                  backgroundColor: Colors.red,
                  label: Text('Sci-fi', style: TextStyle(color: Colors.white),),
                ),
                Chip(
                  backgroundColor: Colors.green,
                  label: Text('Fantasy', style: TextStyle(color: Colors.white),),
                ),
              ],
            ),
          ),
          Space(5),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // User Rating
                // 3.5 / 10
                // 28k
                Expanded(child:
                Container(
                  height: MediaQuery.of(context).size.height  * 0.10,
                  child: Column(
                    children: [
                      Expanded(flex: 1, child: Text("IMDB Rating", style: TextStyle(color: Colors.white, fontSize: 18),),),
                      Expanded(flex: 3, child: ListTile(
                        contentPadding: EdgeInsets.symmetric(horizontal: 4),
                        horizontalTitleGap: 3,
                        title: Text("6.8 / 10", style: TextStyle(color: Colors.white),),
                        subtitle: Text("335k", style: TextStyle(color: Colors.grey),),
                        leading: Icon(Icons.star, color: Colors.green,),
                      ),),
                    ],
                  ),
                )
                ),
                Expanded(child:
                Container(
                  height: MediaQuery.of(context).size.height  * 0.10,
                  child: Column(
                    children: [
                      Expanded(flex: 1, child: Text("Metacine Rating", style: TextStyle(color: Colors.white, fontSize: 18),),),
                      Expanded(flex: 3, child: ListTile(
                        contentPadding: EdgeInsets.symmetric(horizontal: 4),
                        horizontalTitleGap: 3,
                        title: Text("7.0 / 10", style: TextStyle(color: Colors.white),),
                        leading: Icon(Icons.favorite, color: Colors.red,),
                      ),),
                    ],
                  ),
                )
                ),
                Expanded(child:
                Container(
                  height: MediaQuery.of(context).size.height  * 0.10,
                  child: Column(
                    children: [
                      Expanded(flex: 1, child: Text("User Rating", style: TextStyle(color: Colors.white, fontSize: 18),),),
                      Expanded(flex: 3, child: ListTile(
                        contentPadding: EdgeInsets.symmetric(horizontal: 4),
                        horizontalTitleGap: 3,
                        title: Text("3.5 / 10", style: TextStyle(color: Colors.white),),
                        subtitle: Text("28k", style: TextStyle(color: Colors.grey),),
                        leading: Icon(Icons.star, color: Colors.yellow,),
                      ),),
                    ],
                  ),
                )
                ),
              ],
            ),
          ),
          Underline(),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 150,
            child: Column(
              children: [
                const Text("Prochaine séance la plus proche", style: TextStyle(color: Colors.white, fontSize: 24),),
                Expanded(
                    child:
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child:
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text("Cinema Pathé Le Mans", style: TextStyle(color: Color(0xffDB162F)),),
                              time("20h15", "VF"),
                            ],
                          ),
                          OutlinedButton(
                            onPressed: null,
                            child: const Text("RESERVE NOW", style: TextStyle(color: Color(0xffDB162F),),),
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(width: 1, color: Color(0xffDB162F)),
                            ),
                          ),
                        ],
                      ),
                    )
                ),
              ],
            ),
          ),
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
                    Column(
                      children : [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Prochaines séances", style: TextStyle(color: Colors.white),),
                              Row(
                                children: [
                                  Icon(Icons.location_on_outlined, color: Color(0xffDB162F),),
                                  DropdownButton(
                                    value: "Le plus proche",
                                    dropdownColor: Color(0xffDB162F),
                                    items: ['Le plus proche', 'Paris', 'Le Mans'].map<DropdownMenuItem<String>>((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value, style: TextStyle(color: Colors.white),),
                                      );
                                    }).toList(),
                                    onChanged: null,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                            child: DefaultTabController(
                              length: 5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                Container(
                                  child: TabBar(
                                    labelColor: const Color(0xFF0E1111),
                                    unselectedLabelColor:  const Color(0xFF0E1111),
                                    indicatorColor: const Color(0xffDB162F),
                                    tabs: [
                                      Tab(text: 'WEN.'),
                                      Tab(text: 'THU.'),
                                      Tab(text: 'FRI.'),
                                      Tab(text: 'SAT.'),
                                      Tab(text: 'SUN.',),
                                    ],
                                  ),
                                  color: Colors.white,
                                ),
                                Expanded(
                                  child: Container(
                                    child: TabBarView(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("Cinéma Pathé Le Mans", style: TextStyle(color: Colors.white),),
                                              Space(16),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  time("17h55", "VF"),
                                                  Padding(padding: EdgeInsets.symmetric(horizontal: 16.0)),
                                                  time("22h05", "VOST")
                                                ],
                                              ),
                                              Space(32),
                                              time("20h30", "VF"),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          child: Center(
                                            child: Text('2', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
                                          ),
                                        ),
                                        Container(
                                          child: Center(
                                            child: Text('3', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
                                          ),
                                        ),
                                        Container(
                                          child: Center(
                                            child: Text('4', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
                                          ),
                                        ),
                                        Container(
                                          child: Center(
                                            child: Text('5', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                ],
                              ),
                            ),
                        ),
                      ],
                    ),
                    // 2
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(padding: EdgeInsets.symmetric(vertical: 8.0),),
                              const Text("Actors", style: TextStyle(color: Colors.white),),
                              Padding(padding: EdgeInsets.symmetric(vertical: 8.0),),
                              SizedBox(
                                height: 70,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    Row(
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
                                                    'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Chris_Hemsworth_by_Gage_Skidmore_2_%28cropped%29.jpg/220px-Chris_Hemsworth_by_Gage_Skidmore_2_%28cropped%29.jpg',
                                                    fit: BoxFit.cover,
                                                    width: 56,
                                                    height: 56,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(padding: EdgeInsets.symmetric(horizontal: 8.0)),
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("Chris Hemsworth", style: TextStyle(color: Colors.white,),),
                                                Text("Thor", style: TextStyle(color: Colors.grey,),),
                                              ],
                                            ),
                                            Padding(padding: EdgeInsets.symmetric(horizontal: 8.0)),
                                          ],
                                        ),
                                    Row(
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
                                                    'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Chris_Hemsworth_by_Gage_Skidmore_2_%28cropped%29.jpg/220px-Chris_Hemsworth_by_Gage_Skidmore_2_%28cropped%29.jpg',
                                                    fit: BoxFit.cover,
                                                    width: 56,
                                                    height: 56,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(padding: EdgeInsets.symmetric(horizontal: 8.0)),
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("Chris Hemsworth", style: TextStyle(color: Colors.white,),),
                                                Text("Thor", style: TextStyle(color: Colors.grey,),),
                                              ],
                                            ),
                                            Padding(padding: EdgeInsets.symmetric(horizontal: 8.0)),
                                          ],
                                        ),
                                    Row(
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
                                                    'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Chris_Hemsworth_by_Gage_Skidmore_2_%28cropped%29.jpg/220px-Chris_Hemsworth_by_Gage_Skidmore_2_%28cropped%29.jpg',
                                                    fit: BoxFit.cover,
                                                    width: 56,
                                                    height: 56,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(padding: EdgeInsets.symmetric(horizontal: 8.0)),
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("Chris Hemsworth", style: TextStyle(color: Colors.white,),),
                                                Text("Thor", style: TextStyle(color: Colors.grey,),),
                                              ],
                                            ),
                                            Padding(padding: EdgeInsets.symmetric(horizontal: 8.0)),
                                          ],
                                        ),
                                  ],
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
                              const Text("Film crew", style: TextStyle(color: Colors.white),),
                              Padding(padding: EdgeInsets.symmetric(vertical: 8.0),),
                              SizedBox(
                                height: 70,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    Row(
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
                                                'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Chris_Hemsworth_by_Gage_Skidmore_2_%28cropped%29.jpg/220px-Chris_Hemsworth_by_Gage_Skidmore_2_%28cropped%29.jpg',
                                                fit: BoxFit.cover,
                                                width: 56,
                                                height: 56,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(padding: EdgeInsets.symmetric(horizontal: 8.0)),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("Chris Hemsworth", style: TextStyle(color: Colors.white,),),
                                            Text("Thor", style: TextStyle(color: Colors.grey,),),
                                          ],
                                        ),
                                        Padding(padding: EdgeInsets.symmetric(horizontal: 8.0)),
                                      ],
                                    ),
                                    Row(
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
                                                'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Chris_Hemsworth_by_Gage_Skidmore_2_%28cropped%29.jpg/220px-Chris_Hemsworth_by_Gage_Skidmore_2_%28cropped%29.jpg',
                                                fit: BoxFit.cover,
                                                width: 56,
                                                height: 56,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(padding: EdgeInsets.symmetric(horizontal: 8.0)),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("Chris Hemsworth", style: TextStyle(color: Colors.white,),),
                                            Text("Thor", style: TextStyle(color: Colors.grey,),),
                                          ],
                                        ),
                                        Padding(padding: EdgeInsets.symmetric(horizontal: 8.0)),
                                      ],
                                    ),
                                    Row(
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
                                                'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Chris_Hemsworth_by_Gage_Skidmore_2_%28cropped%29.jpg/220px-Chris_Hemsworth_by_Gage_Skidmore_2_%28cropped%29.jpg',
                                                fit: BoxFit.cover,
                                                width: 56,
                                                height: 56,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(padding: EdgeInsets.symmetric(horizontal: 8.0)),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("Chris Hemsworth", style: TextStyle(color: Colors.white,),),
                                            Text("Thor", style: TextStyle(color: Colors.grey,),),
                                          ],
                                        ),
                                        Padding(padding: EdgeInsets.symmetric(horizontal: 8.0)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    // 3
                    Column(
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
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    Card(
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
                                            Text("9 stars", style: TextStyle(color: Colors.white),),
                                            Text("Bigger, bolder, darker and ...better!", style: TextStyle(color: Colors.white),),
                                            Text("This is in no way a knock on the first Thor because I enjoyed it a lot, but, as said with Captain America: The Winter Soldier, Thor: The Dark World impressed me more. The look of the film is wonderful, Asgard is jus...", style: TextStyle(color: Colors.grey),),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Card(
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
                                            Text("9 stars", style: TextStyle(color: Colors.white),),
                                            Text("Bigger, bolder, darker and ...better!", style: TextStyle(color: Colors.white),),
                                            Text("This is in no way a knock on the first Thor because I enjoyed it a lot, but, as said with Captain America: The Winter Soldier, Thor: The Dark World impressed me more. The look of the film is wonderful, Asgard is jus...", style: TextStyle(color: Colors.grey),),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Card(
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
                                            Text("9 stars", style: TextStyle(color: Colors.white),),
                                            Text("Bigger, bolder, darker and ...better!", style: TextStyle(color: Colors.white),),
                                            Text("This is in no way a knock on the first Thor because I enjoyed it a lot, but, as said with Captain America: The Winter Soldier, Thor: The Dark World impressed me more. The look of the film is wonderful, Asgard is jus...", style: TextStyle(color: Colors.grey),),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
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
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    Card(
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
                                            Text("9 stars", style: TextStyle(color: Colors.white),),
                                            Text("Bigger, bolder, darker and ...better!", style: TextStyle(color: Colors.white),),
                                            Text("This is in no way a knock on the first Thor because I enjoyed it a lot, but, as said with Captain America: The Winter Soldier, Thor: The Dark World impressed me more. The look of the film is wonderful, Asgard is jus...", style: TextStyle(color: Colors.grey),),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Card(
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
                                            Text("9 stars", style: TextStyle(color: Colors.white),),
                                            Text("Bigger, bolder, darker and ...better!", style: TextStyle(color: Colors.white),),
                                            Text("This is in no way a knock on the first Thor because I enjoyed it a lot, but, as said with Captain America: The Winter Soldier, Thor: The Dark World impressed me more. The look of the film is wonderful, Asgard is jus...", style: TextStyle(color: Colors.grey),),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Card(
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
                                            Text("9 stars", style: TextStyle(color: Colors.white),),
                                            Text("Bigger, bolder, darker and ...better!", style: TextStyle(color: Colors.white),),
                                            Text("This is in no way a knock on the first Thor because I enjoyed it a lot, but, as said with Captain America: The Winter Soldier, Thor: The Dark World impressed me more. The look of the film is wonderful, Asgard is jus...", style: TextStyle(color: Colors.grey),),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
        )]
      ),
    );
  }
}

class VideoWidget extends StatefulWidget {
  const VideoWidget({Key? key}) : super(key: key);

  @override
  _VideoWidgetState createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  final YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'npvJ9FTgZbM',
    flags: const YoutubePlayerFlags(
      mute: false,
      autoPlay: false,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      controller: _controller,
      showVideoProgressIndicator: true,
    );
}

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

