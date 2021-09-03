import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedCointainerPage extends StatefulWidget {
  const AnimatedCointainerPage({ Key? key }) : super(key: key);

  @override
  _AnimatedCointainerPageState createState() => _AnimatedCointainerPageState();
}

class _AnimatedCointainerPageState extends State<AnimatedCointainerPage> {
  
  double _width=50.0;
  double _height=50.0;
  Color _color=Colors.pink;
  BorderRadiusGeometry _borderRadiusGeometry=BorderRadius.circular(8.0);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated Cointainer")
      ),
      body: Center(
        child:AnimatedContainer(
          duration:Duration(
            milliseconds: 200
          ),
          curve: Curves.easeOutBack,
          width: _width,
          height: _height,
          decoration: BoxDecoration(
            borderRadius: _borderRadiusGeometry,
            color: _color,
          ),

        ) ,),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.change_circle_rounded),
          onPressed: _cambiarBoton
        ),
      
    );
  }

  void _cambiarBoton(){

    final random = new Random();
    setState(() {
              _width=random.nextInt(300).toDouble();
              _height=random.nextInt(300).toDouble();
              _color=Color.fromRGBO(random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);
              _borderRadiusGeometry=BorderRadius.circular(random.nextInt(100).toDouble());
            });
  }
}