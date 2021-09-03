import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card Page'),
        backgroundColor: Colors.amber
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          _cardMain(),
          SizedBox(height: 30),
          _secondCard(),
           SizedBox(height: 30),
            _cardMain(),
          SizedBox(height: 30),
          _secondCard(),
           SizedBox(height: 30),
            _cardMain(),
          SizedBox(height: 30),
          _secondCard(),
           SizedBox(height: 30),
            _cardMain(),
          SizedBox(height: 30),
          _secondCard(),
           SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _cardMain() {
    return Card(
        elevation: 5.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        borderOnForeground: true,
        shadowColor: Colors.red,
        child: Column(
          children: <Widget>[
            ListTile(
                title: Text('Título Tarjeta'),
                subtitle: Text('Prueba tarjeta xd'),
                leading: Icon(Icons.photo_album_outlined, color: Colors.black)),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(onPressed: () {}, child: Text('Hola'))
              ],
            )
          ],
        ));
  }

  Widget _secondCard() {
    final card = Container(
      child: Column(
        children: <Widget>[
          FadeInImage(
              image: NetworkImage(
                  'https://fiverr-res.cloudinary.com/images/q_auto,f_auto/gigs/130238819/original/d4096d4950eba421600f21c6c753c19375222eb6/draw-you-a-landscape-image-with-ms-paint.png'),
              placeholder: AssetImage('assets/jar-loading.gif'),
              fadeInDuration: Duration(milliseconds: 200),
              height: 250,
              fit: BoxFit.cover),
          Container(
              padding: EdgeInsets.all(10), child: Text('Pruebando las card'))
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
            offset: Offset(2.0,10.0)
          )
        ]
      ),
      child: ClipRRect(
        child: card,
        borderRadius: BorderRadius.circular(20.0),
      ),
    );
  }
}
