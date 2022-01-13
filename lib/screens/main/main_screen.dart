import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;
import '../../main.dart';
import 'main_screens.dart';

class MainScreen extends StatefulWidget {
  final String value;

  const MainScreen({Key? key, required this.value}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _formKey = GlobalKey<FormState>();
  final myController = TextEditingController();
  late String filmTitle;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}