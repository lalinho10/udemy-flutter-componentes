import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  double _width = 50.0;
  double _height = 50.0;
  Color _color = Colors.green;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular( 8.0 );

  @override
  Widget build( BuildContext context ) {
    return Scaffold(
      appBar: AppBar(
        title: Text( 'Animated container' ),
      ),
      body: Center(
        child: AnimatedContainer(
          height: _height,
          width: _width,
          decoration: BoxDecoration(
            color: _color,
            borderRadius: _borderRadius
          ),
          duration: Duration( seconds: 1 ),
          curve: Curves.easeInOut,
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon( Icons.play_arrow ),
        onPressed: _changeContainerAttributes
      )
    );
  }

  void _changeContainerAttributes() {
    setState( () {
      final random = Random();

      _width = random.nextInt( 300 ).toDouble();
      _height = random.nextInt( 300 ).toDouble();

      _color = Color.fromRGBO(
        random.nextInt( 256 ),
        random.nextInt( 256 ),
        random.nextInt( 256 ),
        1
      );

      _borderRadius = BorderRadius.circular( random.nextInt( 100 ).toDouble() );
    });
  }

}