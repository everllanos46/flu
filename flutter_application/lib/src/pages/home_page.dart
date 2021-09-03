import 'package:flutter/material.dart';
import 'package:flutter_application/src/pages/providers/menu_provider.dart';
import 'package:flutter_application/src/pages/utils/icon_string.dart';

import 'alert_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Pulsaciones Móvil'),
          backgroundColor: Colors.amber,
        ),
        drawer: Drawer(child: _lista()),
        body: ListView(
          padding: EdgeInsets.all(20),
          children: [
            _bodyCard(),
          ],
        ));
  }

  Widget _bodyCard() {
    final card = Container(
      child: Column(
        children: <Widget>[
          FadeInImage(
              image: NetworkImage(
                  'https://curiosoando.com/wp-content/uploads/2018/02/cardiograma.jpg'),
              placeholder: AssetImage('assets/jar-loading.gif'),
              fadeInDuration: Duration(milliseconds: 200),
              height: 250,
              fit: BoxFit.cover),
          Container(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Pulsaciones',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        )
                      ],
                    ),
                  ),
                  Text('La frecuencia cardiaca es el número de veces que se contrae el corazón durante un minuto (latidos por minuto).' +
                      'Para el correcto funcionamiento del organismo es necesario que el corazón actúe bombeando la sangre hacia todos los órganos, pero además lo debe hacer a una determinada presión (presión arterial) y a una determinada frecuencia. Dada la importancia de este proceso, es normal que el corazón necesite en cada latido un alto consumo de energía.'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[  
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)
                          )
                        ),
                        onPressed: () {},
                        child: Text('Calcular pulsación'),
                        
                      ),
                      
                    ],
                  )
                ],
              ))
        ],
      ),
    );

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                spreadRadius: 2.0,
                offset: Offset(2.0, 10.0))
          ]),
      child: ClipRRect(
        child: card,
        borderRadius: BorderRadius.circular(20.0),
      ),
    );
  }

  Widget _lista() {
    return FutureBuilder(
      future: menuProvider.loadData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _createItemsList(snapshot.data, context),
        );
      },
    );
  }

  Widget _secondCard() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black26,
                blurRadius: 4.0,
                spreadRadius: 2.0,
                offset: Offset(2.0, 2.0))
          ]),
      child: ClipRRect(
        child: FadeInImage(
            image: NetworkImage(
                'https://fiverr-res.cloudinary.com/images/q_auto,f_auto/gigs/130238819/original/d4096d4950eba421600f21c6c753c19375222eb6/draw-you-a-landscape-image-with-ms-paint.png'),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 120,
            width: 220,
            fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(20.0),
      ),
    );
  }

  List<Widget> _createItemsList(List<dynamic>? data, BuildContext context) {
    final List<Widget> opciones = [];
    final finalHeader = DrawerHeader(
      decoration: BoxDecoration(color: Colors.amber),
      child: Stack(
        children: [Align(alignment: Alignment.center, child: _secondCard())],
      ),
    );
    opciones.add(finalHeader);
    data!.forEach((element) {
      final widgetTemp = ListTile(
          title: Text(element['texto']),
          leading: getIcon(element['icon']),
          trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue),
          onTap: () {
            Navigator.pushNamed(context, element['ruta']);
            //Navigator.pushReplacementNamed(context, element['ruta']);
            // final route = MaterialPageRoute(
            //   builder: (context){
            //     return AlertPage();
            //   });
            // Navigator.push(context, route);
          });
      opciones..add(widgetTemp)..add(Divider());
    });
    return opciones;
  }
}
