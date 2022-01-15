import 'package:cine_flash/result.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'header.dart';
import 'package:camera/camera.dart';
import 'package:flutter_mobile_vision_2/flutter_mobile_vision_2.dart';

  var cameraa;


Future<void> main()  async{

  WidgetsFlutterBinding.ensureInitialized();

  final cameras = await availableCameras();//Acquisition de la list de cameras valide sur le périphérique

  final firstCamera = cameras.first;
  //WidgetsFluttterBinding.ensureInitialized();
  cameraa = firstCamera;

  runApp(MyApp(camera: firstCamera));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key,
    required this.camera,
  }) : super(key: key);

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
      ),
      initialRoute: "/",
      routes: {
        '/' : (context) => MyHomePage(camera : this.camera),
        '/result' : (context) => const ResultPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key,
    required this.camera,
  }) : super(key: key);

  final CameraDescription camera;
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class TakePictureScreen extends StatefulWidget {
  const TakePictureScreen({Key? key,
    required this.camera,
  }) : super(key: key);

  final CameraDescription camera;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }

}


class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 1;

  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  int _ocrCamera = FlutterMobileVision.CAMERA_BACK;
  late int cc;
  String _text = "TEXT";

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }



  @override
  void initState(){
    super.initState();

    _controller = CameraController(widget.camera ,ResolutionPreset.max,);

    _initializeControllerFuture = _controller.initialize();

    cc = _controller.cameraId;
    /*
    FlutterMobileVision.start().then((previewSizes) => setState(() {
        _previewOcr = previewSizes[_controller].first;
    }));*/

  }

  @override
  void dispose(){
    _controller.dispose();
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
      print("Mon text : "+_text);
    }on Exception{
      texts.add(new OcrText('Failed to recognize text'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: const WidgetAppBar(returnPage: false,),
      body: FutureBuilder<void>(
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
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try{

            await _initializeControllerFuture;
            _read();
            final image = await _controller.takePicture();

          }catch(e){
            print(e);
          }
          //Navigator.pushNamed(context, '/result');
        },
        tooltip: 'Increment',
        child: const Icon(Icons.search_outlined),
        backgroundColor: const Color(0xffDB162F),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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


/*class TakePictureScreenState extends State<TakePictureScreen>{
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState(){
    super.initState();

    _controller = CameraController(widget.camera,ResolutionPreset.medium,);

    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Container();
  }

}*/


