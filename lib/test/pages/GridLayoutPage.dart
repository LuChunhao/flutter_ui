import 'package:flutter/material.dart';
import 'package:flutter_ui/test/view/gridview.dart';

//class MyApp extends StatelessWidget {
//  final MyGridView myGridView = new MyGridView();
//
//  @override
//  Widget build(BuildContext context) {
//    return new MaterialApp(
//      debugShowCheckedModeBanner: false,
//      home: new Scaffold(
//        appBar: new AppBar(
//          // Here we take the value from the MyHomePage object that was created by
//          // the App.build method, and use it to set our appbar title.
//          title: new Text("GridView Example"),
//        ),
//        body: myGridView.build(),
//      ),
//    );
//  }
//}

class GridLayoutPage extends StatelessWidget {
  static const String gridLayoutPage = "GridLayoutPage";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Grid View"),
      ),
      body: new Center(
        child: new MyGridView().build(),
      ),
    );;
  }

}