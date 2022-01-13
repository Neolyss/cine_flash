import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dart:developer' as developer;

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  late Future<Map<String, dynamic>> _films;

  @override
  Widget build(BuildContext context) {
    _films = loadHistory();
    return Scaffold(
      body:
        FutureBuilder<Map<String, dynamic>>(
          future: _films,
          builder: (BuildContext context, snapshot) {
            if(snapshot.hasData) {
              List<dynamic> films = snapshot.data!["films"];
              return
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Divider(height: 25,),
                      const Text("History", style: TextStyle(fontSize: 30, color: Colors.white),),
                      const Divider(height: 25,),
                      ListView.separated(
                        shrinkWrap: true,
                        itemCount: films.length,
                        itemBuilder: (BuildContext ctx, int index){
                          return Card(
                            child: ListTile(
                              onTap: (){
                                debugPrint('Card tapped.');
                              },
                              title: Text(films[index]["name"], textAlign: TextAlign.center),
                              leading: Image.network(films[index]["link"],
                                //width: 100,
                                // height: 100,
                                fit: BoxFit.cover,
                              ),
                              trailing: const Icon(
                                Icons.arrow_forward_rounded,
                                color: Colors.black,
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const Divider(height: 5,);
                        },
                      ),],),
                );
            }
            else if(snapshot.hasError) {
              return Text('${snapshot.error}');
            } else {
              return const CircularProgressIndicator();
            }
          }
        ),
    );
  }

  Future<Map<String, dynamic>> loadHistory() async {
    final String response = await rootBundle.loadString('json/films.json');
    Map<String, dynamic> json = await jsonDecode(response);
    return json;
  }
}
