import 'dart:io';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:import_file/import_file.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _uri = '';
  String _data = '';
  
  void importCallback() async {
    String uri;
    String data = "";
    try {
      uri = await ImportFile.importFile('*/*');
      print("Got uri: $uri");
      data = await new File(uri)
          .openRead(0, 20)
          .join();
    } on PlatformException {
      uri = 'Failed to get file.';
    }
    setState(() {
      _uri = uri;
      _data = data + "...";});
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('import_file example app'),
        ),
        body: new Center(
          child: new Column(
            children: <Widget>[
              new MaterialButton(
                child: const Text('Import...'),
                onPressed: importCallback,
              ),
              new Text('File requested: $_uri\n'),
              new Text('File data: $_data\n'),
            ],
          ),
        ),
      ),
    );
  }
}
