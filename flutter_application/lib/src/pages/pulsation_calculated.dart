import 'package:flutter/material.dart';

class CalculatedPulsation extends StatefulWidget {
  const CalculatedPulsation({Key? key}) : super(key: key);

  @override
  _CalculatedPulsationState createState() => _CalculatedPulsationState();
}

class _CalculatedPulsationState extends State<CalculatedPulsation> {
  String _identification = "";
  String _nombre = "";
  String _edad = "0";
  String _userEmail = "";
  String _sexo = 'S';
  bool _buttonPulsed=false;
  List<String> _opcionesSelect = ['Seleccione','Masculino', 'Femenino'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Calcular pulsación")),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        children: _crearInputs()
        // _crearUserEmail(),
        // Divider(),
        // _crearUserPass(),
        // Divider(),
        ,
      ),
    );
  }

  List<Widget> _crearInputs() {
    final List<Widget> inputs = [];
    final inputIdentification = TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          labelStyle: TextStyle(color: Colors.black),
          //counter: Text('Letras 0'),
          hintText: 'Identificación',
          labelText: 'Ingrese su identificación',
          suffixIcon: Icon(Icons.perm_identity),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      onChanged: (valor) {
        _identification = valor;
      },
    );
    inputs..add(inputIdentification)..add(Divider());
    final inputName = TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          labelStyle: TextStyle(color: Colors.black),
          //counter: Text('Letras 0'),
          hintText: 'Nombre',
          labelText: 'Ingrese su nombre',
          suffixIcon: Icon(Icons.person),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      onChanged: (valor) {
        _nombre = valor;
      },
    );
    inputs..add(inputName)..add(Divider());
    final inputEdad = TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          labelStyle: TextStyle(color: Colors.black),
          //counter: Text('Letras 0'),
          hintText: 'Edad',
          labelText: 'Ingrese su edad',
          suffixIcon: Icon(Icons.perm_identity),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      onChanged: (valor) {
        _edad = valor;
      },
    );
    inputs..add(inputEdad)..add(Divider());
    inputs..add(_createSelect())..add(Divider());
    inputs..add(_createButton())..add(Divider());
    inputs..add(_createPerson())..add(Divider());

    return inputs;
  }

  Widget _createButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        TextButton(
          style: TextButton.styleFrom(
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40))),
          onPressed: () {
            setState(() {
              _buttonPulsed=true;
              _createPerson();
            });
          },
          child: Text('Calcular pulsación'),
        ),
      ],
    );
  }

  List<DropdownMenuItem<String>> _getOptions() {
    List<DropdownMenuItem<String>> lista = [];
    _opcionesSelect.forEach((element) {
      lista.add(DropdownMenuItem(
          value: (element == 'Masculino') ? 'M' : (element == 'Femenino') ? 'F' : 'S', child: Text(element)));
    });
    return lista;
  }

  Widget _createSelect() {
    return Row(
      children: [
        Icon(Icons.select_all),
        SizedBox(
          width: 30.0,
        ),
        Expanded(
            child: DropdownButton(
                items: _getOptions(),
                style: TextStyle(color: Colors.black),
                value: _sexo,
                onChanged: (option) {
                  print(option);
                  setState(() {
                    _sexo = option.toString();
                  });
                }))
      ],
    );
  }

  Widget _crearUserEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          labelStyle: TextStyle(color: Colors.black),
          //counter: Text('Letras 0'),
          hintText: 'Email',
          labelText: 'Ingrese su email',
          suffixIcon: Icon(Icons.mark_email_read),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      onChanged: (value) => _userEmail = value,
    );
  }

  Widget _crearUserPass() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
          labelStyle: TextStyle(color: Colors.black),
          //counter: Text('Letras 0'),
          hintText: 'Contraseña',
          labelText: 'Ingrese su contraseña',
          suffixIcon: Icon(Icons.password),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      onChanged: (value) => _userEmail = value,
    );
  }

  double _pulsation() {
    int edad = (int.parse(_edad));
    if(_sexo == 'M'){
      return (220-edad) / 10;
    }else if (_sexo == 'F'){
      return (210 - edad) / 10;
    }else{
      return 0;
    }
  }

  Widget _createPerson() {
    
    Map<String, dynamic> persona = {
      'identificacion': _identification,
      'nombre': _nombre,
      'edad': _edad,
      'pulsacion': _pulsation().toString()
    };

    return (_buttonPulsed)? Card(
        elevation: 5.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        borderOnForeground: true,
        shadowColor: Colors.red,
        child: Column(
          children: <Widget>[
            ListTile(
                title: Text(
                  'Persona',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                subtitle: Text('Datos de la persona'),
                leading: Icon(Icons.person_pin_outlined, color: Colors.black)),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Identificación: ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        )),
                    Text(persona['identificacion'])
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Nombre: ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        )),
                    Text(persona['nombre'])
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Edad: ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        )),
                    Text(persona['edad'])
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Pulsación: ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        )),
                    Text(persona['pulsacion'])
                  ],
                )
              ],
            )
          ],
        )) : Card(
          );
  }
}
