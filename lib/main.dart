import 'package:cine_flash/screens/result/result.dart';
import 'package:cine_flash/screens/main/history_screen.dart';
import 'package:cine_flash/screens/main/library_screen.dart';
import 'package:cine_flash/screens/main/main_screen.dart';
import 'package:cine_flash/screens/main/main_screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'components/header.dart';
import 'dart:developer' as developer;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const CineFlash());
}

class CineFlash extends StatelessWidget {
  const CineFlash({Key? key}) : super(key: key);

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
        ResultScreen.routeName : (context) => const ResultScreen(),
      },
    );
  }
}

