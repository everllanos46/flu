import 'package:flutter/material.dart';
import 'package:flutter_application/src/pages/alert_page.dart';


import 'src/pages/routes/routes.dart';
//import 'package:flutter_application/src/pages/home_temp.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plo Aplication',
      theme: ThemeData(primarySwatch: Colors.amber),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: getRoutes(),
      onGenerateRoute: (settings){
        print(settings.name);
        return MaterialPageRoute(
          builder: (context)=> AlertPage());
      },
    );
  }
}