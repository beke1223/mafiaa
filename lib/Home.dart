import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MAFIA"),
      ),
      body: Container(
        height: double.infinity,
        color: Colors.blueAccent[25],
      ),
      floatingActionButton: FabCircularMenu(
          alignment: Alignment.bottomRight,
          ringColor: Colors.blue.withAlpha(25),
          ringDiameter: 390.0,
          ringWidth: 100.0,
          fabSize: 90.0,
          fabElevation: 8.0,
          fabIconBorder: CircleBorder(),
          children: <Widget>[
            RawMaterialButton(
              onPressed: () {},
              elevation: 10.0,
              fillColor: Colors.green,
              child: Icon(
                Icons.help,
                size: 30.0,
              ),
              padding: EdgeInsets.all(15.0),
              shape: CircleBorder(),
            ),
            RawMaterialButton(
              onPressed: () {},
              elevation: 10.0,
              fillColor: Colors.orange,
              child: Icon(
                Icons.settings,
                size: 30.0,
              ),
              padding: EdgeInsets.all(15.0),
              shape: CircleBorder(),
            ),
            const CircleAvatar(
              radius: 30,
              backgroundColor: Color.fromARGB(255, 191, 116, 204),
              child: Text(
                "Join",
                style: TextStyle(
                    fontSize: 15.0, color: Color.fromARGB(255, 255, 255, 255)),
              ),
            ),
            Stack(
              alignment: Alignment.bottomCenter,
              children: const [
                CircleAvatar(
                  radius: 35,
                  backgroundColor: Colors.white,
                  child: Text(
                    "Host",
                    style: TextStyle(
                        fontSize: 15.0, color: Color.fromARGB(255, 95, 92, 92)),
                  ),
                ),
              ],
            ),
          ]),
    );
  }
}
