import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

/**
 * 组件布局
 * 1.row column
 * 2.手势测试
 */
main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Title One",
      home: MyAppHome(),
    );
  }
}

class MyAppHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MyAppHomeState();
  }
}

Widget switchMainColumn() {
  return new Center(
    child: new Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        new Expanded(
          child: new Image.asset("images/img_1.png"),
          flex: 1,
        ),
        new Expanded(
          child: new Image.asset("images/img_2.png"),
          flex: 2,
        ),
        new Expanded(
          child: new Image.asset("images/img_3.png"),
          flex: 1,
        ),
      ],
    ),
  );
}

Widget switchMainRow() {
  return new Center(
    child: new Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        new Expanded(
          child: new Image.asset("images/img_1.png"),
          flex: 1,
        ),
        new Expanded(
          child: new Image.asset("images/img_2.png"),
          flex: 2,
        ),
        new Expanded(
          child: new Image.asset("images/img_3.png"),
          flex: 1,
        ),
      ],
    ),
  );
}

class MyAppHomeState extends State<MyAppHome> {
  bool switchFlag = false;

  var buttonClickText = generateWordPairs().take(1);

  @override
  Widget build(BuildContext context) {
    //普通弹窗
    Future<bool> showNormalAlert() {
      return showDialog(
          context: context,
          builder: (context) {
            return new AlertDialog(
              title: Text("标题"),
              content: SingleChildScrollView(
                child: ListBody(
                  children: [
                    Text("内容1"),
                    Text("内容2"),
                  ],
                ),
              ),
              actions: [
                new FloatingActionButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: Text("取消"),
                ),
                new FloatingActionButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: Text("确定"),
                ),
              ],
            );
          }).then((value) {
        print('$value');
        return value;
      });
    }

    //提示形弹窗
    showTipAlert() {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return SimpleDialog(
              children: [
                SimpleDialogOption(
                  child: Text("内容1"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                SimpleDialogOption(
                  child: Text("内容2"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          });
    }

    //测试弹窗按钮
    var testAlertButton = ElevatedButton(
        style: ButtonStyle(
            foregroundColor: MaterialStateColor.resolveWith((states) {
          if (states.contains(MaterialState.focused) &&
              !states.contains(MaterialState.pressed)) {
            //获取焦点时颜色
            return Colors.blueAccent;
          }
          if (states.contains(MaterialState.pressed)) {
            //按下时颜色
            return Colors.red;
          }
          //平时颜色
          return Colors.white;
        })),
        child: new Text("短按长按"),
        onPressed: () {
          showNormalAlert().then((result) {
            if (result) {
              print('用户OK');
            } else {
              print("用户取消");
            }
          });
        });

    /**
     * 获取图控件
     */
    var getPicWidget = switchFlag ? switchMainRow() : switchMainColumn();

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Title Two"),
        actions: [
          new IconButton(
            onPressed: () {
              setState(() {
                switchFlag = !switchFlag;
              });
            },
            icon: new Icon(Icons.switch_left),
            tooltip: "点击切换图标布局方式",
          ),
        ],
      ),
      body: new Container(
        child: new Column(
          children: [
            new Row(
              children: [
                Container(
                  width: 300,
                  height: 300,
                  child: getPicWidget,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(70, 0, 0, 0),
                  width: 100,
                  height: 20,
                  child: GestureDetector(
                    onLongPress: () {
                      showTipAlert().then((value) => null);
                    },
                    child: testAlertButton,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
