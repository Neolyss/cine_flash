import 'package:cine_flash/result.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'header.dart';
import 'dart:developer' as developer;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return MaterialApp(
      title: 'CineFlash',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xffDB162F),
          foregroundColor: Colors.white,
        ),
        primarySwatch: Colors.red,
      ),
      initialRoute: "/",
      routes: {
        '/' : (context) => MyHomePage(),
        ResultPage.routeName : (context) => const ResultPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  late List<Widget> screens;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 1;
  final _formKey = GlobalKey<FormState>();
  final myController = TextEditingController();

  late String filmTitle;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: const WidgetAppBar(returnPage: false,),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/result', arguments: ScreenArguments(filmTitle));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.search_outlined),
        backgroundColor: const Color(0xffDB162F),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(// The validator receives the text that the user has entered.
                controller: myController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Validate returns true if the form is valid, or false otherwise.
                    if (_formKey.currentState!.validate()) {
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.
                      developer.log(myController.text);
                      Navigator.pushNamed(context, '/result', arguments: ScreenArguments(myController.text));
                    }
                  },
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
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

class ScreenArguments {
  final String title;

  ScreenArguments(this.title);
}

