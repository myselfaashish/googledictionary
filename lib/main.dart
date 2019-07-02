import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' show Client;
import 'package:flutter/material.dart';

void main() {
  return runApp(Check());
}

Future fetctList() async {
  var uri =
      'https://googledictionaryapi.eu-gb.mybluemix.net/?define=abacus&lang=en';
  var encoded = Uri.encodeFull(uri);
  Client client = Client();
  final response = await client.get(encoded);
  //print(response.body.toString());

  if (response.statusCode == 200) {
    print(response.body);
  } else {
    throw Exception('Failed to load post');
  }
}

class Check extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: Center(
              child: new RaisedButton(
              onPressed: fetctList,
            ),
          ),
        ),
      ),
    );
  }
}
