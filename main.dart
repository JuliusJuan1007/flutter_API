import 'package:flutter/material.dart';
import 'key.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Cuaca Iklim '),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
_String? _kotaInput;

  Future _goToNextPage(BuildContext context) async {
    Map result = await Navigator.of(context).push(MaterialPageRoute<dynamic>(builder: (context) {
      return changeCity();
    }));

    if (result != null && result.containsKey("kota")) {
      print(result["kota"].toString());



    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.orangeAccent,
        actions: [
          IconButton(
            onPressed: (){
              _goToNextPage(context);
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              'images/pemandangan.jpg',
              fit: BoxFit.fill,
              color: Colors.white.withOpacity(0.5),
            colorBlendMode: BlendMode.modulate,
            ),
          ),
          Container(
            alignment: Alignment.topRight,
            child: Text(
              '$_kotaInput == null ? key.defaultCity' : $_kotaInput,
              style: kotaStyle,
            ),
            margin: EdgeInsets.fromLTRB(0.0, 11, 20, 0.0),
          ),
          Container(
            alignment: Alignment.center,
            child: Image.asset(
              'images/light_rain.png',
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.fromLTRB(0.0, 150, 20, 0),
            child: Text(
              '30C',
            ),
          )
        ]),       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

TextStyle kotaStyle = const TextStyle(
  fontSize: 30,
  color: Colors.blue,
);


class changeCity extends StatelessWidget{
  var kotaFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Pilih Kota'),
          centerTitle: true,
        ),
        body: Stack(children: [
          Center(
            child: Image.asset(
              'images/white_snow.png',
              fit: BoxFit.fill,
            ),
          ),
          ListView(
            children: [
              ListTile(
                  title: TextField(
                    decoration: InputDecoration(hintText: 'Cari Kota' ),controller:kotaFieldController ,
                    keyboardType: TextInputType.text,
                  )),
              ListTile(
                title: TextButton(
                  onPressed: () {
                    Navigator.pop(context, {'kota': kotaFieldController.text});
                  },
                  style: TextButton.styleFrom(backgroundColor: Colors.orangeAccent),
                  child: Text(
                    'Pilih',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],),
        ]));
  }
}
