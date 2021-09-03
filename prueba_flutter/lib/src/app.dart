import 'package:flutter/material.dart';
import 'package:prueba_flutter/src/pages/home_page.dart';
import 'package:prueba_flutter/src/pages/cont_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(context) {
    return MaterialApp(
      home: Center(
        child: ContPage()
      ),
    );
  }
}
