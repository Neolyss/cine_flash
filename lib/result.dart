import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'header.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key}) : super(key: key);

  SizedBox space(double value) {
    return SizedBox(
      height: value,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E1111),
      appBar: const WidgetAppBar(returnPage: true,),
      body: ListView(
        children: [
          space(10),
          Center(
            child: Text("Thor: le monde des ténèbres", style: TextStyle(color: Colors.white, fontSize: 30),),
          ),
          space(5),
          Center(
            child: Text("30 octobre 2013 ⸱ 1h52", style: TextStyle(color: Colors.grey, fontSize: 20),),
          ),
          space(10),
          Container(
            height: 150.0,
            width: 150.0,
            color: Colors.transparent,
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                ),
                child: new Center(
                  child: new Text("Video player",
                    style: TextStyle(fontSize: 22, color: Colors.black),
                    textAlign: TextAlign.center,),
                )),
            ),
          space(5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
               Chip(
                  backgroundColor: Colors.blue,
                  label: const Text('Tous public'),
                ),
               Chip(
                  backgroundColor: Colors.red,
                  label: const Text('Sci-fi'),
                ),
               Chip(
                  backgroundColor: Colors.green,
                  label: const Text('Fantasy'),
                ),
            ],
          ),
          space(5),
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
          space(10),
          DefaultTabController(
            length: 4, // length of tabs
            initialIndex: 0,
            child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
              Container(
                decoration : BoxDecoration(
                    border: Border(top: BorderSide(color: Colors.grey, width: 0.5))
                ),
                child: TabBar(
                labelColor: const Color(0xffDB162F),
                unselectedLabelColor: Colors.white,
                indicatorColor: const Color(0xffDB162F),
                tabs: [
                  Tab(icon: Icon(Icons.calendar_today_outlined),text: 'SEANCES'),
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
                      child: Center(
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
