import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * 蛋糕介绍页
 */
main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //strawberry pavlova
    return new MaterialApp(
      theme: new ThemeData(
        primaryColor: Colors.cyanAccent,
      ),
      title: "蛋糕介绍",
      home: MyAppHome(),
    );
  }
}

class MyAppHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var descTextStyle = new TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w800,
        fontFamily: 'Roboto',
        letterSpacing: 0.5,
        fontSize: 18.0,
        height: 2.0);
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("蛋糕介绍"),
      ),
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          new Stack(
            alignment: new Alignment(0.0, 0.7),
            children: [
              new Image.asset("images/berry.png"),
              new Container(
                decoration: new BoxDecoration(color: Colors.black45),
                child: new Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [new Text("CAKE",
                    style: new TextStyle(fontSize: 21.0, color: Colors.white)),new Icon(Icons.comment,color: Colors.white,),new Icon(Icons.phone,color: Colors.white)],),
              )
            ],
          ),
          DefaultTextStyle.merge(
              style: descTextStyle,
              child: new Expanded(
                  child: new Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _title,
                  new Container(child: _description),
                  _starAndReviews,
                  _processParameters,
                ],
              ))),
        ],
      ),
    );
  }

  Widget _title = new Text(
    "Strawberry Pavlova",
    style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 21.0),
  );

  Widget _description = new Text(
    """
            Pavlova os a meringue-based dessert named after the Russian ballerine Anna Pavlova.Pavlova featues a crisp crust and soft,light inside,topped with fruit and whipped cream.
            """,
    textAlign: TextAlign.center,
  );

  Widget _starAndReviews = new Container(
    // decoration: new BoxDecoration(color: Colors.lightBlueAccent),
    // padding: new EdgeInsets.all(20.0),
    child: new Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        new Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            new Icon(
              Icons.star,
              color: Colors.green,
            ),
            new Icon(
              Icons.star,
              color: Colors.green,
            ),
            new Icon(
              Icons.star,
              color: Colors.green,
            ),
            new Icon(
              Icons.star_half,
              color: Colors.green,
            ),
            new Icon(Icons.star_border),
          ],
        ),
        new Text(" Reviews"),
      ],
    ),
  );

  Widget _processParameters = new Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      new Column(
        children: [
          new Icon(
            Icons.kitchen,
            color: Colors.green,
          ),
          new Text("PREP:"),
          new Text("25 min"),
        ],
      ),
      new Column(
        children: [
          new Icon(
            Icons.timer,
            color: Colors.green,
          ),
          new Text("COOK:"),
          new Text("1 hr"),
        ],
      ),
      new Column(
        children: [
          new Icon(
            Icons.restaurant,
            color: Colors.green,
          ),
          new Text("FEEDS:"),
          new Text("4-6"),
        ],
      ),
    ],
  );
}
