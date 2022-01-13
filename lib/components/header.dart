import 'package:flutter/material.dart';

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
        title: Image.asset('images/CineIcon.png', fit: BoxFit.cover,),
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
    const ListTile(leading: Icon(Icons.home, color: Color(0xFF0E1111)), title: Text("Home", style: TextStyle(color: Color(0xFF0E1111)))),
    const ListTile(leading: Icon(Icons.confirmation_num_outlined, color: Color(0xFF0E1111)), title: Text("Tickets", style: TextStyle(color: Color(0xFF0E1111)))),
    const ListTile(leading: Icon(Icons.settings_outlined, color: Color(0xFF0E1111)), title: Text("Settings", style: TextStyle(color: Color(0xFF0E1111)))),
    const ListTile(leading: Icon(Icons.people, color: Color(0xFF0E1111)), title: Text("About us", style: TextStyle(color: Color(0xFF0E1111)))),
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      // backgroundColor: const Color(0xffDB162F),
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
                    color: Color(0x66DB162F),
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
}

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

