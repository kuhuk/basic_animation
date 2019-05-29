import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(BasicAnimation());

class BasicAnimation extends StatefulWidget {
  @override
  _BasicAnimationState createState() => _BasicAnimationState();
}

class _BasicAnimationState extends State<BasicAnimation> {

  // Basic Animation
  double _width = 50;
  double _height = 50;
  Color _color = Colors.green;
  BorderRadiusGeometry _borderRadiusGeometry = BorderRadius.circular(8);

  // Fade Animation
  bool _visible = true;

  void fadeWidget () {
    // Make sure to call setState(). This tells Flutter to rebuild UI with the changes.
    setState(() {
      _visible = !_visible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Animation Basics"),
          ), // AppBar
          body: SingleChildScrollView(
            child: Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                  AnimatedContainer(
                      width: _width,
                      height: _height,
                      decoration: BoxDecoration(
                          color: _color,
                          borderRadius: _borderRadiusGeometry
                      ),
                      curve: Curves.easeInBack,
                      duration: Duration(seconds: 2)), // AnimatedContainer
                AnimatedOpacity(
                  // If the widget should be visible, animate to 1.0 (fully visible)
                  // If the widget should be invisible, animate to 0.0 (invisible)
                  opacity: _visible ? 1.0 : 0.0,
                  duration: Duration(milliseconds: 500),
                  child: Container(
                    width: _width,
                    height: _height,
                    color: _color,
                  ), // Container
                ), // AnimatedOpacity
                new RaisedButton(
                    onPressed: fadeWidget,
                    child: Icon(Icons.flip),
                ), // RaisedButton | This trailing comma makes auto-formatting nicer for build methods.
              ], // children
          ), // Column
          ), // Center,
          ), // SingleChildScrollView
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.play_arrow),
            onPressed: () {
              setState(() {
                // Create a random number generator
                final random = Random();

                // Generate a random width and height
                _width = random.nextInt(300).toDouble();
                _height = random.nextInt(300).toDouble();

                // Generate a random color
                _color = Color.fromRGBO(random.nextInt(256), random.nextInt(256), random.nextInt(256), 1);

                // Generate a random border radius
                _borderRadiusGeometry = BorderRadius.circular(random.nextInt(100).toDouble());
              }); // setState
            }, // onPressed
          ) //FloatingActionButton
      ) // Scaffold
    ); // MaterialApp
  } // Widget
}
