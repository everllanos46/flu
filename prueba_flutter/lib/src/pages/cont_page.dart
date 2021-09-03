import 'package:flutter/material.dart';

class ContPage extends StatefulWidget {
  @override
  createState() => _ContPageState();
}

class _ContPageState extends State<ContPage> {
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
          children: <Widget>[
            Text("Hola cómo estás", style: labelStyle),
            Text("$cont", style: labelStyle)
          ],
        ),
      ),
    
      floatingActionButton: _crearBotones(),
    );
  }
  Widget _crearBotones(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
      FloatingActionButton(
        child: Icon(Icons.minimize),
        onPressed: () {
          cont--;
          setState(() {
            
          });
        }, 
    ),
    SizedBox( width: 270.0,)
    ,
    FloatingActionButton(
        
        child: Icon(Icons.add),
        onPressed: () {
          cont++;
          setState(() {
            
          });
        }, 
    )

    ],);
    
    
    
  }
}
