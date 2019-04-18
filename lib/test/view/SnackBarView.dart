import 'package:flutter/material.dart';


class SnackBarView extends StatelessWidget {
  static const String snackBarView = "SnackBarView";
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Using SnackBar"),
      ),
      body: new Center(
        child: new MyButton(),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new RaisedButton(
      child: new Text('Show SnackBar'),
      // On pressing the raised button
      onPressed: () {
        // show snackbar
        Scaffold.of(context).showSnackBar(new SnackBar(
          // set content of snackbar
          content: new Text("Hello! I am SnackBar :)"),
          // set duration
          duration: new Duration(seconds: 3),
          backgroundColor: Colors.red,
          // set the action
          action: new SnackBarAction(
              label: "Hit Me (Action)",
              onPressed: () {
                // When action button is pressed, show another snackbar
                Scaffold.of(context).showSnackBar(new SnackBar(
                  content: new Text(
                      "Hello! I am shown becoz you pressed Action :)"),
                ));
              }),
        ));
      },
    );
  }
}