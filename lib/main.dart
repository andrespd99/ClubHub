import 'package:flutter/material.dart';
import 'package:pruebais/Calendario.dart';
import 'package:pruebais/add_socio.dart';
import 'package:pruebais/admin_panel.dart';
import 'package:pruebais/invitaciones.dart';
import 'package:pruebais/listasocios_page.dart';
import 'package:pruebais/principal.dart';
import 'package:pruebais/login.dart';
import 'package:pruebais/Reservaciones.dart';
import 'Reservaciones.dart';
//import 'package:pruebais/routes.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  int _currentIndex = 0;

  Widget callPage(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return Principal();
      case 1:
        return Invitaciones();
      case 2:
        return Calendario();
      case 3:
        return Reservaciones();
      case 4:
        return AdminPanel();

        break;
      default:
        return Principal();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'scaffold Example',
      routes: {
        // Cuando naveguemos hacia esta ruta , crearemos el Widget addsocio
        '/add-socio': (context) => AddSocio(),
        '/listasociospage': (context) => ListasPage(),
      },
      home: MainMenu(),
      initialRoute: '/login',
      onGenerateRoute: _getRoute,
    );
  }

  Widget MainMenu() {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: callPage(_currentIndex),
      drawer: invokeDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (value) {
          _currentIndex = value;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
              backgroundColor: Colors.blue,
              icon: Icon(Icons.home), //ICONO DE HOME
              title: Text('Principal')),
          BottomNavigationBarItem(
              backgroundColor: Colors.blue,
              icon: Icon(Icons.person_add),
              title: Text('Invitaciones') // ICONO INVITACIONES
              ),
          BottomNavigationBarItem(
              backgroundColor: Colors.blue,
              icon: Icon(Icons.calendar_today),
              title: Text('Calendario') //ICONO CALENDARIO
              ),
          BottomNavigationBarItem(
              backgroundColor: Colors.blue,
              icon: Icon(Icons.hotel),
              title: Text('Reservaciones') //ICONO RESERVACIONES
              ),
          BottomNavigationBarItem(
              backgroundColor: Colors.blue,
              icon: Icon(Icons.insert_emoticon),
              title: Text('Administrar') //ICONO RESERVACIONES
              )
        ],
      ),
    );
  }
}

Route<dynamic> _getRoute(RouteSettings settings) {
  if (settings.name != '/login') {
    return null;
  }

  return MaterialPageRoute<void>(
    settings: settings,
    builder: (BuildContext context) => LoginPage(),
    fullscreenDialog: true,
  );
}

Widget invokeDrawer() {
  return Drawer(
    child: new ListView(
      children: <Widget>[
        UserAccountsDrawerHeader(
          accountName: Text("Valeska De Ponte"),
          accountEmail: Text("Valeskadeponte@prueba.es"),
          currentAccountPicture: CircleAvatar(backgroundColor: Colors.white),
          decoration: BoxDecoration(
            color: Colors.lightBlue,
          ),
        ),
        ListTile(
          title: Text('precio de invitaciones'),
          leading: Icon(Icons.info),
        ),
        ListTile(
          title: Text('Historial de Pagos'),
          leading: Icon(Icons.payment),
        ),
        ListTile(
          title: Text('Historial de visitas'),
          leading: Icon(Icons.visibility),
        ),
        ListTile(
          title: Text('Historial de invitados'),
          leading: Icon(Icons.person_pin),
        ),
        ListTile(
          title: Text('Configuracion de cuenta'),
          leading: Icon(Icons.new_releases),
        ),
        ListTile(
          title: Text('soporte al cliente'),
          leading: Icon(Icons.help),
        ),
        ListTile(
          title: Text('cerrar sesion'),
          leading: Icon(Icons.close),
          onTap: () {
            
          },
        ),
      ],
    ),
  );
}
