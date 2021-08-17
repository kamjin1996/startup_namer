import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * 用户首页
 */
main() {
  runApp(new MaterialApp(
    title: "这是标题",
    home: AppHome(),
  ));
}

class AppHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //构建一个按钮列
    Column buildButtonColumn(IconData icon, String label) {
      var color = Theme.of(context).primaryColor;
      return new Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          new Icon(icon, color: color),
          new Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: new Text(
              label,
              style: new TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ],
      );
    }

    Widget titleSection = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Row(
        children: [
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                new Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: new Text(
                    // 'Oeschinen Lake Campground',
                    '就是玩',
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                new Text(
                  'Kandersteg, Switzerland',
                  style: new TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          // new Icon(
          //   Icons.star,
          //   color: Colors.red[500],
          // ),
          // new Text('41'),
          new FavoriteWidget(),
        ],
      ),
    );

    //选择布局
    Widget buttonSection = new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildButtonColumn(Icons.call, "CALL"),
          buildButtonColumn(Icons.near_me, "ROUTE"),
          buildButtonColumn(Icons.share, "SHARE"),
        ],
      ),
    );

    //文本部分
    // final text  = """
    //       Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.
    //       """;
    final text =
        "jujujujujujujujujujujujujujujujujujujujujujujujujujujujujujujujujujujujujujujujujujujujujujujujujujujujujujujujujujujujujujujujujujujujujujujujujujujujujujujuju";
    Widget textSection = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Text(text, softWrap: true),
    );

    //图片部分

    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Flutter Demo1"),
        ),
        body: new Center(
          child: new ListView(
            children: [
              new Image.asset(
                'images/img.png',
                height: 240.0,
                fit: BoxFit.cover,
              ),
              // ...

              titleSection,
              buttonSection,
              textSection,
            ],
          ),
        ));
  }
}

/**
 * 喜欢控件
 */
class FavoriteWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _FavoriteWidgetState();
  }
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 41;

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        new Container(
          padding: new EdgeInsets.all(0.0),
          child: new IconButton(
            onPressed: _toggleFavorite,
            icon: _isFavorited
                ? new Icon(Icons.star)
                : new Icon(Icons.star_border),
            color: Colors.red[500],
          ),
        ),
        new SizedBox(
          //当文本在40和41之间变化时，将文本放在SizedBox中并设置其宽度可防止出现明显的“跳跃” ，因为这些值具有不同的宽度
          width: 18.0,
          child: new Container(
            child: new Text("$_favoriteCount"),
          ),
        )
      ],
    );
  }
}
