import 'package:clubhub/colors.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // TODO: Add text editing controllers (101)
  @override
  Widget build(BuildContext context) {
    Widget blueCircle = new Container(
      alignment: Alignment.center,
      width: 600,
      height: 600,
      decoration: new BoxDecoration(
        color: kClubhubBlue300,
        shape: BoxShape.circle,
      ),
    );

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            //blueCircle,
            SizedBox(height: 80.0),
            Column(
              children: <Widget>[
                Image.asset('assets/diamond.png'),
                SizedBox(height: 16.0),
                Text('CLUBHUB'),
              ],
            ),
            SizedBox(height: 180.0),
            //[Username]
            AccentColorOverride(
              color: kClubhubBlue900,
              child: TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                ),
              ),
            ),
            SizedBox(height: 24.0),
            //[Password]
            AccentColorOverride(
              color: kClubhubBlue900,
              child: TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
                obscureText: true,
              ),
            ),
            ButtonBar(
              children: <Widget>[
                RaisedButton(
                  elevation: 8.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(18.0)),
                  ),
                  child: Center(
                    child: Text('SIGUIENTE'),
                  ),
                  onPressed: () {
                    // Navigator.pop(context);
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

final _usernameController = TextEditingController();
final _passwordController = TextEditingController();

class AccentColorOverride extends StatelessWidget {
  const AccentColorOverride({Key key, this.color, this.child})
      : super(key: key);

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Theme(
      child: child,
      data: Theme.of(context).copyWith(
        accentColor: color,
        brightness: Brightness.dark,
      ),
    );
  }
}
