
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/db/Database.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_app/model/Client.dart';

void showDbClients(BuildContext context) {
  Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (_) => buildDbClients()));
}

Widget buildDbClients() => Scaffold(
  appBar: AppBar(
    title: const Text('Clients from db'),
  ),
  body: FutureBuilder(
      future: _getFromDb(),
      builder: (BuildContext context, AsyncSnapshot<List<Client>> snapshot) {
        if (snapshot.hasData) {
          return buildContainer(snapshot.data);
        } else {
          return Container();
        }
      }),
);

Widget buildContainer(List<Client> content) =>
    ListView.builder(
        scrollDirection: Axis.vertical,
        padding: new EdgeInsets.all(6.0),
        itemCount: content.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            alignment: FractionalOffset.center,
            margin: new EdgeInsets.only(bottom: 6.0),
            padding: new EdgeInsets.all(6.0),
            child: new Text(
              "${content[index].firstName} ${content[index].lastName} is blocked: ${content[index].blocked}",
              style: biggerFont,
            ),
          );
        });

Future<List<Client>> _getFromDb() async {
  var res = await DBProvider.db.getAllClients();
  return res;
}