import 'package:flutter/material.dart';

class NextShowing extends StatefulWidget {
  const NextShowing({Key? key}) : super(key: key);

  @override
  _NextShowingState createState() => _NextShowingState();
}

class _NextShowingState extends State<NextShowing> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 150,
      child: Column(
        children: [
          const Text("Next nearest showing", style: TextStyle(color: Colors.white, fontSize: 24),),
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
                      children: const [
                        Text("Cinema Pathé Le Mans", style: TextStyle(color: Color(0xffDB162F)),),
                        Time(hour: "20", min: "15", version: "OV"),
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
    );
  }
}

class Time extends StatefulWidget {
  final String hour;
  final String min;
  final String version;

  const Time({Key? key, required this.hour, required this.min, required this.version}) : super(key: key);

  @override
  _TimeState createState() => _TimeState();
}

class _TimeState extends State<Time> {
  @override
  Widget build(BuildContext context) {
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
            Text(widget.hour + ":" + widget.min, style: const TextStyle(color: Colors.white, fontSize: 16),),
            Text(widget.version, style: const TextStyle(color: Colors.grey, fontSize: 14),),
          ],
        )
    );
  }
}

class NextShowings extends StatefulWidget {
  const NextShowings({Key? key}) : super(key: key);

  @override
  _NextShowingsState createState() => _NextShowingsState();
}

class _NextShowingsState extends State<NextShowings> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
                              SizedBox(
                                height: 16,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  Time(hour: "20", min: "55", version: "VF"),
                                  Padding(padding: EdgeInsets.symmetric(horizontal: 16.0)),
                                  Time(hour: "22", min:"05", version:"VOST"),
                                ],
                              ),
                              SizedBox(
                                height: 32,
                              ),
                              Time(hour: "20", min: "30", version: "VF"),
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
    );
  }
}

