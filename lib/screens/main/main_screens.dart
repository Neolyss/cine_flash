import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../components/header.dart';
import 'history_screen.dart';
import 'library_screen.dart';
import 'main_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> pageList = <Widget>[
    const HistoryScreen(),
    const MainScreen(value: "Main "),
    const LibraryScreen(),
  ];
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: const WidgetAppBar(returnPage: false,),
      body: pageList[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar (
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fullscreen),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_movies_rounded),
            label: "",
          )
        ],
        currentIndex: _selectedIndex,
        backgroundColor: const Color(0xffDB162F),
        unselectedItemColor: Colors.white,
        selectedItemColor: const Color(0xFF0E1111),
        onTap: _onItemTapped,
      ),// This trailing comma makes auto-formatting nicer for build methods.
      drawer: const WidgetDrawer(),
    );
  }
}
