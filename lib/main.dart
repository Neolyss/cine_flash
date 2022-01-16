import 'package:cine_flash/screens/film/film_screen.dart';
import 'package:cine_flash/screens/main/main_screens.dart';
import 'package:cine_flash/screens/settings_screen.dart';
import 'package:cine_flash/screens/tickets_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:camera/camera.dart';
import 'package:flutter_mobile_vision_2/flutter_mobile_vision_2.dart';
import 'components/header.dart';
import 'dart:developer' as developer;

var camera;

Future<void> main()  async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  //Acquisition de la list de cameras valide sur le périphérique
  final cameras = await availableCameras();

  final firstCamera = cameras.first;
  camera = firstCamera;

  runApp(CineFlash(camera: firstCamera));
}

class CineFlash extends StatelessWidget {
  const CineFlash({Key? key, required this.camera,}) : super(key: key);

  final CameraDescription camera;
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
        scaffoldBackgroundColor: const Color(0xFF0E1111),
      ),
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName : (context) => const HomeScreen(),
        FilmScreen.routeName : (context) => const FilmScreen(),
        SettingsScreen.routeName : (context) => const SettingsScreen(),
        TicketsScreen.routeName : (context) => const TicketsScreen(),
      },
    );
  }
}

class ScreenArguments {
  final String title;

  ScreenArguments(this.title);
}