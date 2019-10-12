import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            semanticLabel: 'menu'
          ),
          onPressed: () {
            print('menu button tapped');
          },
        ),
        title: Text('CLUBHUB'),
      )
    );
  }
}
