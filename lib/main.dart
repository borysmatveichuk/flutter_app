import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/db/Database.dart';
import 'package:flutter_app/model/Client.dart';
import 'package:flutter_app/model/ListWrapper.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math' as math;
import 'DbClients.dart';

final biggerFont = const TextStyle(fontSize: 18.0);

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.green),
      home: RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RandomWordState();
}


class RandomWordState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _saved = Set<WordPair>();
  final _biggerFont = const TextStyle(fontSize: 18.0);

  ListWrapper _users;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
        actions: <Widget>[
          IconButton(icon: const Icon(Icons.list), onPressed: _pushSaved),
          //IconButton(icon: const Icon(Icons.sync), onPressed: _networkRequest)
          IconButton(icon: const Icon(Icons.sync), onPressed: _addToDb),
          IconButton(icon: const Icon(Icons.print), onPressed: () => showDbClients(context))
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) => buildSuggestionItem(i));
  }

  Widget buildSuggestionItem(int i) {
    if (i.isOdd) return Divider();

    final index = i ~/ 2;
    if (index >= _suggestions.length) {
      _suggestions.addAll(generateWordPairs().take(10));
    }
    return _buildRow(_suggestions[index]);
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }

  void _networkRequest() {
    _getNetworkData();

    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Network data'),
        ),
        body: Center(
          child: Text(
            _users != null ? _users?.results?.toString() : "Getting data...",
            textAlign: TextAlign.center,
            style: _biggerFont,
          ),
        ),
      );
    }));
  }

  _getNetworkData() async {
    String url = "https://randomuser.me/api/?results=100&exc=login,id";
    var response = await http.get(url);
    if (response.statusCode == 200) {
      setState(() {
        _users = ListWrapper.fromJson(jsonDecode(response.body));
      });
    } else {
      print("Request failed: ${response.statusCode}");
    }
  }

  void _pushSaved() {
    Navigator.of(context)
        .push(MaterialPageRoute<void>(builder: (BuildContext context) {
      final Iterable<ListTile> tiles = _saved.map((WordPair pair) {
        return ListTile(
          title: Text(
            pair.asPascalCase,
            style: _biggerFont,
          ),
        );
      });
      final List<Widget> divided =
          ListTile.divideTiles(context: context, tiles: tiles).toList();
      return Scaffold(
        appBar: AppBar(
          title: const Text('Saved Suggestions'),
        ),
        body: ListView(children: divided),
      );
    }));
  }



  void _addToDb() async {
    Client rnd = testClients[math.Random().nextInt(testClients.length)];
    print("Client: ${rnd.firstName}");

    var res = await DBProvider.db.insertClient(rnd);
    print("Insert result: $res");
    //setState(() {});
  }

  List<Client> testClients = [
    Client(firstName: "Raouf", lastName: "Rahiche", blocked: false),
    Client(firstName: "Zaki", lastName: "oun", blocked: true),
    Client(firstName: "oussama", lastName: "ali", blocked: false),
  ];
}