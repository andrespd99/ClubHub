import 'package:flutter/material.dart';
import 'package:pruebais/Calendario.dart';
import 'package:pruebais/invitaciones.dart';
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

        break;
      default:
        return Principal();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'scaffold Example',
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
              )
        ],
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
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
            Reservaciones();
          },
        ),
      ],
    ),
  );
}
