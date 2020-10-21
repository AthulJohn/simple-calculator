import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int no1 = 0, no2 = 0, answer = 0;
  Widget calculatorbutton(int num) {
    return Expanded(
      child: FlatButton(
        color: Colors.grey,
        child: Text("$num"),
        onPressed: () {
          setState(() {
            no2 = no2 * 10 + num;
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter app'),
      ),
      body: Column(
        children: [
          Expanded(
              child: Container(
            color: Colors.black,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "$no2",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
                Text(
                  "$answer",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                  textAlign: TextAlign.right,
                )
              ],
            ),
          )),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                calculatorbutton(7),
                calculatorbutton(8),
                calculatorbutton(9),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                calculatorbutton(4),
                calculatorbutton(5),
                calculatorbutton(6),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                calculatorbutton(1),
                calculatorbutton(2),
                calculatorbutton(3),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: FlatButton(
                    color: Colors.blue,
                    child: Text("+"),
                    onPressed: () {
                      setState(() {
                        no1 = no1 + no2;
                        answer = no1;
                        no2 = 0;
                      });
                    },
                  ),
                ),
                calculatorbutton(0),
                Expanded(
                  child: FlatButton(
                    color: Colors.blue,
                    child: Text("="),
                    onPressed: () {
                      setState(() {
                        answer = no1 + no2;
                        no1 = 0;
                        no2 = 0;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
