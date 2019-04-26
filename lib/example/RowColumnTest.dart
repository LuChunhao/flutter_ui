import 'package:flutter/material.dart';

class RowColumnTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Welcome to Flutter',
      theme: new ThemeData(primaryColor: Colors.blue),
      //home: new RowColumn()
      home: new Scaffold(
        appBar: new AppBar(title: new Text("RowColumnTest")),
        body: new Container(
          child: getWidget(),
        ),
      ),
    );
  }
}

/// 主视图
getWidget() {
  return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Expanded(child: getLeftWidget(), flex: 2),
        new Expanded(
            child: new Image.asset(
              "images/cake.jpg",
              fit: BoxFit.fitWidth,
              width: 445,
              height: 295,
            ),
            flex: 3)
      ]);
//  return new Row(
////    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
////    crossAxisAlignment: CrossAxisAlignment.center,
//    children: <Widget>[
//      new Expanded(child: new Image.asset("images/Black.jpg"),flex: 2,),
//      new Expanded(child: new Image.asset("images/Brown.jpg"),flex: 2,),
//      new Expanded(child: new Image.asset("images/BudGreen.jpg"),flex: 2),
//      new Expanded(child: new Image.asset("images/Burgundy.jpg"),flex: 2,),
//    ],
//  );

//  return new ListView(
//    padding: new EdgeInsets.all(0.0),
//    addAutomaticKeepAlives: true,
//    children: <Widget>[
//      new Image.asset("images/Black.jpg"),
//      new Image.asset("images/Brown.jpg"),
//      new Image.asset("images/BudGreen.jpg"),
//      new Image.asset("images/Burgundy.jpg"),
//    ],
//  );

//  return new Expanded(
//      child: new Column(
//    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//    crossAxisAlignment: CrossAxisAlignment.center,
//    children: <Widget>[
////      new Image.asset("images/Black.jpg"),
//      new Image.asset("images/Brown.jpg"),
//      new Image.asset("images/BudGreen.jpg"),
//      new Image.asset("images/Burgundy.jpg"),
//    ],
//  ));
}

/// 左边视图
getLeftWidget() {
  return new Container(
    padding: EdgeInsets.all(5),
    child: new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Text(
          "Strawberry Pavlova",
          style: TextStyle(
              fontSize: 14,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        new Text(
          "布局框架允许您根据需要在行和列内部再嵌套行和列。让我们看下面红色边框圈起来部分的布局代码：",
          textAlign: TextAlign.center,
        ),
        getStarReviewWidget(),
      ],
    ),
  );
}

/// 构建star reviews
getStarReviewWidget() {
  return new Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    mainAxisSize: MainAxisSize.min,
    children: [
      new Expanded(
        child: new Row(
          mainAxisSize: MainAxisSize.min,
//        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Icon(Icons.star, color: Colors.green[500]),
            new Icon(Icons.star, color: Colors.green[500]),
            new Icon(Icons.star, color: Colors.green[500]),
            new Icon(Icons.star, color: Colors.black),
            new Icon(Icons.star, color: Colors.black),
          ],
        ),
      ),
      new Expanded(child: new Text(
        "170 Reviews",
        style: TextStyle(
          fontSize: 12,
          fontFamily: 'Roboto',
          letterSpacing: 0.5,
        ),
      )),
    ],
  );
}

class RowColumn extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new RowColumnSample();
}

class RowColumnSample extends State<RowColumn> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("RowColumnTest")),
      body: new Center(
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Image.asset("images/Black.jpg"),
            new Image.asset("images/Brown.jpg"),
            new Image.asset("images/BudGreen.jpg"),
            new Image.asset("images/Burgundy.jpg"),
          ],
        ),
      ),
    );
  }
}
