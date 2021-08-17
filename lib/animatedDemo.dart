import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * InWalk 晕开效果
 */
main() {
  String _title = "我是标题";

  runApp(MaterialApp(
    home: Scaffold(
      body: Center(child: MyAppHome()),
    ),
    title: _title,
    theme: ThemeData(
      primaryColor: Colors.blue,
    ),
  ));
}

class MyAppHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppHomeState();
  }
}

class _MyAppHomeState extends State<MyAppHome> {
  double sideLength = 50;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: sideLength,
      width: sideLength,
      duration: const Duration(seconds: 2),
      curve: Curves.easeIn,
      child: Material(
        color: Colors.yellow,
        child: InkWell(
          onTap: () {
            setState(() {
              sideLength == 50 ? sideLength = 100 : sideLength = 50;
            });
          },
        ),
      ),
    );
  }
}
