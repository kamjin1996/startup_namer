import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main() {
  runApp(new MaterialApp(
    title: "文件操作",
    home: MyAppHome(),
  ));
}

class MyAppHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppHomeState();
  }
}

class MyAppHomeState extends State<MyAppHome> {
  late int _counter = 0;

  /**
   * 获取本地文件counter
   */
  Future<File> _getLocalFile() async {
    String path = (await getApplicationDocumentsDirectory()).path;
    var file = new File("$path/counter.txt");
    return file;
  }

  Future<Null> _incrementCounter() async {
    setState(() {
      _counter++;
    });
    await (await _getLocalFile()).writeAsString('$_counter');
  }

  Future<int> _readCount() async {
    try {
      var file = await _getLocalFile();
      String content = await file.readAsString();
      return int.parse(content);
    } on FileSystemException {
      print('error FileSystemException');
      return 0;
    } on IOException {
      print('error IOException');
      return 0;
    }
  }

  @override
  void initState() {
    super.initState();
    //读取文件的counter
    _readCount().then((value) {
      setState(() {
        _counter = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Center(
          child: new Text('tap times:$_counter ${_counter == 1 ? '' : 's'}.')),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: "Increment",
        child: new Icon(Icons.add),
      ),
    );
  }
}
