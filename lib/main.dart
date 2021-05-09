import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_api/Users.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Users _users;

  @override
  void initState() {
    super.initState();
    this.getUsers();
  }

  Future getUsers() async {
    final response = await http.post(Uri.parse('https://reqres.in/api/users'),);
    if (response.statusCode == 200) {
     setState(() {
             _users = Users.fromJson(jsonDecode(response.body));
          });
    }
  }

  _addUser() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users"),
      ),
      body: _users == null
          ? Text("No records found.")
          : ListView.builder(
              itemCount: _users.data.length,
              itemBuilder: (BuildContext context, int index) => ListTile(
                    title: Text(_users.data[index].firstName),
                  )),
      floatingActionButton: FloatingActionButton(
        onPressed: _addUser,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
