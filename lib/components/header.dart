import 'package:cine_flash/screens/main/main_screens.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;

import '../screens/settings_screen.dart';
import '../screens/tickets_screen.dart';

class WidgetAppBar extends StatefulWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  final bool returnPage;

  const WidgetAppBar({Key? key, required this.returnPage}) : preferredSize = const Size.fromHeight(kToolbarHeight), super(key: key);

  @override
  _WidgetAppBarState createState() => _WidgetAppBarState();
}

class _WidgetAppBarState extends State<WidgetAppBar> {

  IconButton buttonMenu() {
    if(!widget.returnPage) {
      return IconButton(
          icon: const Icon(Icons.menu, color: Colors.white,),
          onPressed: () => Scaffold.of(context).openDrawer()
      );
    }
    return IconButton(
      icon: const Icon(Icons.arrow_back, color: Colors.white,),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
        leading: Builder(builder: (context) => // Ensure Scaffold is in context
          buttonMenu()
        ),
        title: Container(
          padding: const EdgeInsets.all(4.0),
          height: 56,
          child: Image.asset('images/CineIcon.png', fit: BoxFit.scaleDown,),
        ),
        centerTitle: true,
    );
  }
}

class WidgetDrawer extends StatefulWidget {
  const WidgetDrawer({Key? key}) : super(key: key);

  @override
  _WidgetDrawerState createState() => _WidgetDrawerState();
}

class _WidgetDrawerState extends State<WidgetDrawer> {

  var menuElements = [
    const WidgetButtonDrawer(icon: Icons.home, title: "Home", route: HomeScreen.routeName,),
    const WidgetButtonDrawer(icon: Icons.confirmation_num_outlined, title: "Tickets", route: TicketsScreen.routeName,),
    const WidgetButtonDrawer(icon: Icons.settings_outlined, title: "Settings", route: SettingsScreen.routeName,),
    const WidgetButtonDrawer(icon: Icons.people, title: "About us", route: HomeScreen.routeName,),
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      //backgroundColor: Colors.white,
      //backgroundColor: const Color(0xffDB162F),
      backgroundColor: const Color(0xFF0E1111),
      child : ListView (
        children: [
          Container(
            padding: EdgeInsets.zero,
            margin: EdgeInsets.zero,
            height: 56,
            child: DrawerHeader(
              padding: EdgeInsets.zero,
              margin: EdgeInsets.zero,
              decoration: const BoxDecoration(
                // boxShadow: [ BoxShadow(offset: Offset(0, 1), color: Color(0x77000000))],
                color: Color(0xffDB162F),
                // border: Border(
                //   bottom: BorderSide(width: 2, color: Colors.black)
                // )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("CineFlash", style: TextStyle(color: Colors.white),)
                ],
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height - 56,
            child: ListView.separated(
                itemCount: menuElements.length,
                itemBuilder: (BuildContext ctxt, int index) {
                  return menuElements[index];
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    //color: Colors.white,
                    color: Color(0xDDDB162F),
                    height: 1,
                    indent: 10,
                    endIndent: 10,
                    thickness: 1,
                  );
                }
            ),
          ),
        ],
      ),
    );
  }
}

class WidgetButtonDrawer extends StatefulWidget {
  const WidgetButtonDrawer({Key? key, required this.icon, required this.title, required this.route}) : super(key: key);

  final IconData icon;
  final String title;
  final String route;

  @override
  _WidgetButtonDrawerState createState() => _WidgetButtonDrawerState();
}

class _WidgetButtonDrawerState extends State<WidgetButtonDrawer> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, widget.route);
      },
      child: ListTile(
        leading: Icon(widget.icon, color: Color(0xDDDB162F)),
        title: Text(widget.title, style: TextStyle(color: Color(0xffffffff))),
      ),
    );
  }
}

/*
* Container(padding: EdgeInsets.zero,
            margin: EdgeInsets.zero,
            height: 64,
            child: DrawerHeader(
              padding: EdgeInsets.zero,
              margin: EdgeInsets.zero,
              decoration: const BoxDecoration(
                color: Color(0xffDB162F),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("CineFlash", style: TextStyle(color: Colors.white),)
                ],
              ),),),*/
/* ListView.separated(
        itemCount: menuElements.length,
        itemBuilder: (BuildContext ctxt, int index) {
          return menuElements[index];
        },
        separatorBuilder: (context, index) {
          return Divider(
            color: Theme.of(context).primaryColor,
          );
        }),*/
/*child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              padding: EdgeInsets.zero,
              margin: EdgeInsets.zero,
              height: 64,
              child: DrawerHeader(
                padding: EdgeInsets.zero,
                margin: EdgeInsets.zero,
                decoration: const BoxDecoration(
                  color: Color(0xffDB162F),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("CineFlash", style: TextStyle(color: Colors.white),)
                  ],
                ),
              ),
            ),
          ],
        ),*/
/*
*ListView(
            Container(
                padding: EdgeInsets.zero,
                margin: EdgeInsets.zero,
                height: 64,
                child: DrawerHeader(
                  padding: EdgeInsets.zero,
                  margin: EdgeInsets.zero,
                  decoration: const BoxDecoration(
                    color: Color(0xffDB162F),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text("CineFlash", style: TextStyle(color: Colors.white),)
                    ],
                  ),
                ),
              ),
          )
 */

