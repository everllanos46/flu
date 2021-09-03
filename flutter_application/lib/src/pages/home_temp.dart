import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget{

  final options =['Uno', 'Dos','Tres'];

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(
        title: Text('Holaa'),
        backgroundColor: Colors.amber,
      ),
      body: ListView(
        children: _addItemsShortVersion(),
      ),
    );
    
  }

  List<Widget> _addItems(){
    
    List<Widget> lista = [];
    for (var item in options) {
        final tempWidget = ListTile(
          title: Text(item),
        );
        lista.add(tempWidget);
        lista.add(Divider());
    }

    return lista;
  }

  List<Widget> _addItemsShortVersion(){
    
    var widgets=options.map((o) {
      return Column(
        children: [
          ListTile(
            title: Text(o),
            leading: Icon(Icons.add),
            trailing: Icon(Icons.keyboard_arrow_right_outlined),
            onTap: (){},
          ),
          Divider()
        ],
      );
    }).toList();

    return widgets;
  }


}