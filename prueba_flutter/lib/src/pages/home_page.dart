import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  final labelStyle = new TextStyle(fontSize: 25);
  int cont =0;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Prueba Aplicación"),
        centerTitle: true,
      ),
      body: Center(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget> [
          Text("Hola cómo estás", style: labelStyle),
          Text("0", style: labelStyle)
        ],),
      
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Hola'),
          content:  Text('Hola Mundo', style: labelStyle),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      ),),
    );
  }
}