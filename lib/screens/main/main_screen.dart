import 'package:camera/camera.dart';
import 'package:cine_flash/models/film.dart';
import 'package:cine_flash/screens/film/film_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobile_vision_2/flutter_mobile_vision_2.dart';
import 'dart:developer' as developer;

import '../../main.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key, required this.camera}) : super(key: key);

  final CameraDescription camera;

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _formKey = GlobalKey<FormState>();
  final myController = TextEditingController();
  late String filmTitle;

  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  int _ocrCamera = FlutterMobileVision.CAMERA_BACK;
  late int cc;
  String _text = "TEXT";

  @override
  void initState(){
    super.initState();
    _controller = CameraController(widget.camera ,ResolutionPreset.max,);
    _initializeControllerFuture = _controller.initialize();
    cc = _controller.cameraId;
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _controller.dispose();
    myController.dispose();
    super.dispose();
  }

  Future<Null> _read() async{
    List<OcrText> texts = [];
    try{
      texts = await FlutterMobileVision.read(
        camera: _ocrCamera,
        waitTap: true,
        //camera: _controller.cameraId,
      );

      setState((){
        _text = texts[0].value;
      });
      developer.log("Mon text : "+_text);
    }on Exception{
      texts.add(new OcrText('Failed to recognize text'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
            try {
              await _initializeControllerFuture;
              //_read();
              //final image = await _controller.takePicture();
              const String title = "Guardians of the Galaxy Vol.2";
              String id = await findFilm(title);
              //const String id = "tt0371746";
              Navigator.pushNamed(context, FilmScreen.routeName, arguments: ScreenArguments(id));
            } catch (e) {
              print(e);
            }
        },
        tooltip: 'Increment',
        child: const Icon(Icons.search_outlined),
        backgroundColor: const Color(0xffDB162F),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body:
        FutureBuilder<void>(
          future: _initializeControllerFuture,
          builder: (context,snapshot){
            if(snapshot.connectionState == ConnectionState.done){
              return CameraPreview(_controller);
              //return CameraPreview(_read());
            }else{
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      /*Center(
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
                      Navigator.pushNamed(context, FilmScreen.routeName, arguments: ScreenArguments(myController.text));
                    }
                  },
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ), */
    );
  }
}