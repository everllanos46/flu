import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  const AlertPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Alert Page"), backgroundColor: Colors.amber),
      body: Center(
          child: ElevatedButton(
        child: Text("Alert Page"),
        style: ElevatedButton.styleFrom(
            onPrimary: Colors.black,
            primary: Colors.amber,
            shape: StadiumBorder()),
        onPressed: () => _showAlert(context),
      )),
    );
  }

  void _showAlert(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            title: Text('Alerta'),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('Hola como estás'),
                FlutterLogo(
                  size: 100,
                )
              ],
            ),
            actions: <Widget>[
              TextButton(child: Text('Cancelar'), onPressed: () {})
            ],
          );
        });
  }
}
