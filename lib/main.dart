import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'components/card_sum.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color _myColor = Colors.grey;
  Color _firstSonColor = Colors.blue[200];
  Color _secondSonColor = Colors.blue[200];

  void changeMyColor() {
    setState(() {
      _myColor = Colors.primaries[Random().nextInt(Colors.primaries.length)];
    });
  }

  void changeFirstSonColor() {
    setState(() {
      _firstSonColor =
          Colors.primaries[Random().nextInt(Colors.primaries.length)];
    });
  }

  void changeSecondSonColor() {
    setState(() {
      _secondSonColor =
          Colors.primaries[Random().nextInt(Colors.primaries.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: _myColor,
                elevation: 4,
                child: Container(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          RaisedButton(
                            onPressed: changeMyColor,
                            textColor: Colors.white,
                            color: Colors.purple[800],
                            padding: const EdgeInsets.all(0.0),
                            child: Text("My color"),
                          ),
                          RaisedButton(
                            onPressed: () {
                              changeFirstSonColor();
                              changeSecondSonColor();
                            },
                            textColor: Colors.white,
                            color: Colors.purple[800],
                            padding: const EdgeInsets.all(0.0),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text("Change Sons Colors"),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          RaisedButton(
                            onPressed: changeFirstSonColor,
                            textColor: Colors.white,
                            color: Colors.purple[800],
                            padding: const EdgeInsets.all(0.0),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text("Change First"),
                            ),
                          ),
                          RaisedButton(
                            onPressed: changeSecondSonColor,
                            textColor: Colors.white,
                            color: Colors.purple[800],
                            padding: const EdgeInsets.all(0.0),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text("Change second son"),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CardSum(_firstSonColor, changeFirstSonColor,
                              changeMyColor),
                          CardSum(_secondSonColor, changeSecondSonColor,
                              changeMyColor),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
