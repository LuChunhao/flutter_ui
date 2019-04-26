import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Welcome to Flutter',
      theme: new ThemeData(primaryColor: Colors.blue),
      home: new SampleAppPage(),
    );
  }
}

class SampleAppPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _SampleAppPageState();
}

class _SampleAppPageState extends State<SampleAppPage> {
  // Default placeholder text
  String textToShow = "Hello world";
  int count = 1;
  bool toggle = true;

  void _updateText() {
    setState(() {
      textToShow = textToShow + '$count';
      count++;
    });
  }

  _updateToggle() {
    setState(() {
      toggle = !toggle;
    });
  }

  _getToggleChild() {
    if (toggle) {
      return new Text(
        "This is a TextView",
        // ignore: argument_type_not_assignable
        style: new TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
        textAlign: TextAlign.center,
//          maxLines: 3,
        overflow: TextOverflow.fade,
      );
    } else {
      return new MaterialButton(
        onPressed: () {
          setState(() {
            textToShow = "Hello world";
            count = 1;
          });
        },
        child: new Text(
          textToShow,
          style: new TextStyle(fontSize: 30),
        ),
        padding: EdgeInsets.all(20),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('hello world'),
      ),
      body: new Center(
        child: _getToggleChild(),
      ),
      floatingActionButton: new FloatingActionButton(
          onPressed: _updateToggle,
          tooltip: "update text",
          child: new Icon(Icons.update)),
    );
  }
}
