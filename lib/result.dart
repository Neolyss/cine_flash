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
                  child: TabBarView(children: <Widget>[
                    Container(
                      child: Center(
                        child: Text('Display Tab 1', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Container(
                      child:
                        Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 200,
                              child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    Container(
                                      width: 200,
                                      child: ListTile(
                                        leading: Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Chris_Hemsworth_by_Gage_Skidmore_2_%28cropped%29.jpg/220px-Chris_Hemsworth_by_Gage_Skidmore_2_%28cropped%29.jpg'),
                                        title: Text("Chris Hemsworth", style: TextStyle(color: Colors.white,),),
                                        subtitle: Text("Thor", style: TextStyle(color: Colors.grey,),),
                                      ),
                                    ),
                                    Container(
                                      width: 200,
                                      child: ListTile(
                                        leading: Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Chris_Hemsworth_by_Gage_Skidmore_2_%28cropped%29.jpg/220px-Chris_Hemsworth_by_Gage_Skidmore_2_%28cropped%29.jpg'),
                                        title: Text("Chris Hemsworth", style: TextStyle(color: Colors.white,),),
                                        subtitle: Text("Thor", style: TextStyle(color: Colors.grey,),),
                                      ),
                                    ),
                                    Container(
                                      width: 200,
                                      child: ListTile(
                                        leading: Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Chris_Hemsworth_by_Gage_Skidmore_2_%28cropped%29.jpg/220px-Chris_Hemsworth_by_Gage_Skidmore_2_%28cropped%29.jpg'),
                                        title: Text("Chris Hemsworth", style: TextStyle(color: Colors.white,),),
                                        subtitle: Text("Thor", style: TextStyle(color: Colors.grey,),),
                                      ),
                                    ),
                                    Container(
                                      width: 200,
                                      child: ListTile(
                                        leading: Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Chris_Hemsworth_by_Gage_Skidmore_2_%28cropped%29.jpg/220px-Chris_Hemsworth_by_Gage_Skidmore_2_%28cropped%29.jpg'),
                                        title: Text("Chris Hemsworth", style: TextStyle(color: Colors.white,),),
                                        subtitle: Text("Thor", style: TextStyle(color: Colors.grey,),),
                                      ),
                                    ),
                                  ]
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 200,
                              child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    Container(
                                      width: 200,
                                      child: ListTile(
                                        leading: Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Chris_Hemsworth_by_Gage_Skidmore_2_%28cropped%29.jpg/220px-Chris_Hemsworth_by_Gage_Skidmore_2_%28cropped%29.jpg'),
                                        title: Text("Chris Hemsworth", style: TextStyle(color: Colors.white,),),
                                        subtitle: Text("Thor", style: TextStyle(color: Colors.grey,),),
                                      ),
                                    ),
                                    Container(
                                      width: 200,
                                      child: ListTile(
                                        leading: Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Chris_Hemsworth_by_Gage_Skidmore_2_%28cropped%29.jpg/220px-Chris_Hemsworth_by_Gage_Skidmore_2_%28cropped%29.jpg'),
                                        title: Text("Chris Hemsworth", style: TextStyle(color: Colors.white,),),
                                        subtitle: Text("Thor", style: TextStyle(color: Colors.grey,),),
                                      ),
                                    ),
                                    Container(
                                      width: 200,
                                      child: ListTile(
                                        leading: Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Chris_Hemsworth_by_Gage_Skidmore_2_%28cropped%29.jpg/220px-Chris_Hemsworth_by_Gage_Skidmore_2_%28cropped%29.jpg'),
                                        title: Text("Chris Hemsworth", style: TextStyle(color: Colors.white,),),
                                        subtitle: Text("Thor", style: TextStyle(color: Colors.grey,),),
                                      ),
                                    ),
                                    Container(
                                      width: 200,
                                      child: ListTile(
                                        leading: Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Chris_Hemsworth_by_Gage_Skidmore_2_%28cropped%29.jpg/220px-Chris_Hemsworth_by_Gage_Skidmore_2_%28cropped%29.jpg'),
                                        title: Text("Chris Hemsworth", style: TextStyle(color: Colors.white,),),
                                        subtitle: Text("Thor", style: TextStyle(color: Colors.grey,),),
                                      ),
                                    ),
                                  ]
                              ),
                            ),
                          ],
                        )
                    ),
                    Container(
                      child: Center(
                        child: Text('Display Tab 3', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Container(
                      child: const Center(
                        child: Text('Display Tab 4', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ])
              )
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

