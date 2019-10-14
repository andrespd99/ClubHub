import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getListView(),
    );
  }
}

List<String> getListElements() {
  var items = List<String>.generate(30, (counter) => "Invitado #$counter");

  return items;
}

Widget getListView() {

  var listItems = getListElements();

  var listView = ListView.builder(
    itemBuilder: (context, index) {

      return ListTile(
        title: Text(listItems[index]),
      );
    },
  );
}
