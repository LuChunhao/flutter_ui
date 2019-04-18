import 'package:flutter/material.dart';
import 'package:flutter_ui/test/contactlist/contact_page.dart';
import 'package:flutter_ui/test/drawer/account.dart';
import 'package:flutter_ui/test/drawer/home.dart';
import 'package:flutter_ui/test/drawer/settings.dart';
import 'package:flutter_ui/test/pages/DropdownButtonPage.dart';
import 'package:flutter_ui/test/pages/GridLayoutPage.dart';
import 'package:flutter_ui/test/pages/InfiniteListPage.dart';
import 'package:flutter_ui/test/pages/LoginPage.dart';
import 'package:flutter_ui/test/pages/SharedPreferencesPage.dart';
import 'package:flutter_ui/test/view/EditTextView.dart';
import 'package:flutter_ui/test/FadeAppTest.dart';
import 'package:flutter_ui/test/HttpGet.dart';
import 'package:flutter_ui/test/LoadJson.dart';
import 'package:flutter_ui/test/MyApp.dart';
import 'package:flutter_ui/test/PaintDemo.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_ui/test/RowColumnTest.dart';
import 'package:flutter_ui/test/StatelessWidgets.dart';
import 'package:flutter_ui/test/StepperDemo.dart';
import 'package:flutter_ui/test/view/SnackBarView.dart';
import 'package:flutter_ui/test/view/tablayout.dart';
import 'package:flutter_ui/utils/textUtil.dart' as utils;
import './utils/textUtil.dart' as textUtil;
import 'package:flutter_ui/utils/commonUtil.dart' as commonUtil;

void main() {
  //debugPaintSizeEnabled=true;
  StatelessWidget widget;
  widget = new MyApp();
//  widget = new RowColumnTest();
//  widget = new FadeAppTest();
//  widget = new PaintDemo();
//  widget = new StatelessWidgets();
  //widget = new EditTextView();
//  widget = new LoadJson();
  //widget = new HttpGet();
  //widget = new StepperDemo();
  //widget = new TabLayout();
  //runApp(widget);
//  runApp(navigationDrawer());
  runApp(widget);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home: new MyAppSample(),
      routes: <String, WidgetBuilder>{
        // 注册界面
        HomeScreen.HOME: (BuildContext context) => new HomeScreen(),
        TabLayout.TABLAYOUT: (BuildContext context) => new TabLayout(),
        FadeAppTest.FADEAPP: (BuildContext context) => new FadeAppTest(title: 'Fade Demo'),
        HttpGet.httpGet: (BuildContext context) => new HttpGet(),
        ListViewUsing.listViewUsing: (BuildContext context) => new ListViewUsing(),
        SnackBarView.snackBarView: (BuildContext context) => new SnackBarView(),
        GridLayoutPage.gridLayoutPage: (BuildContext context) => new GridLayoutPage(),
        DropdownButtonPage.dropdownButton: (BuildContext context) => new DropdownButtonPage(),
        InfiniteListPage.infiniteListPage: (BuildContext context) => new InfiniteListPage(),
        LoginPage.loginPage: (BuildContext context) => new LoginPage(),
        SharedPreferencesPage.sharedPreferencesPage: (BuildContext context) => new SharedPreferencesPage(),
      },
    );
  }
}

class MyAppSample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new MyAppState();
}

class MyAppState extends State<MyAppSample> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: new Text(
          "My Flutter APP",
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      body: new ListView(
        children: <Widget>[
//        new RaisedButton.icon(onPressed: (){}, icon: new Icon(Icons.access_alarm), label: new Text("test"))
          new RaisedButton(
            onPressed: () =>
                Navigator.of(context).pushNamed(TabLayout.TABLAYOUT),
            child: new Text("tabLayout + viewpage"),
          ),
          new FloatingActionButton(
            onPressed: () {
              Navigator.of(context).pushNamed(HomeScreen.HOME);
            },
            child: new Icon(Icons.account_balance),
          ),
          new MaterialButton(
            onPressed: () =>
                Navigator.of(context).pushNamed(FadeAppTest.FADEAPP),
            child: new Text('Fade App'),
            padding: new EdgeInsets.only(left: 10.0, right: 10.0),
          ),
          new RaisedButton(
            onPressed: () => Navigator.of(context).pushNamed(HttpGet.httpGet),
            child: new Text("Http Get"),
          ),
          new RaisedButton(
            onPressed: () =>
                Navigator.of(context).pushNamed(ListViewUsing.listViewUsing),
            child: new Text("ListViewUsing"),
          ),
          new RaisedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(SnackBarView.snackBarView);
            },
            child: new Text("showSnackBar"),
          ),
          new RaisedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(GridLayoutPage.gridLayoutPage);
            },
            child: new Text("Grid View"),
          ),
          new RaisedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(DropdownButtonPage.dropdownButton);
            },
            child: new Text("DropdownButton"),
          ),
          new Image.network("http://shp.qpic.cn/ishow/2735041709/1555463886_-695593207_22439_sProdImgNo_7.jpg/0"),
          new Image.network("http://shp.qpic.cn/ishow/2735041709/1555464892_1186005513_29965_sProdImgNo_7.jpg/0"),
          new RaisedButton(onPressed: () => Navigator.of(context).pushNamed(InfiniteListPage.infiniteListPage),
            child: new Text("InfiniteList"),),
          new RaisedButton(onPressed: () => Navigator.of(context).pushNamed(LoginPage.loginPage),
            child: new Text("谷歌登录"),),
          new RaisedButton(onPressed: () => Navigator.of(context).pushNamed(SharedPreferencesPage.sharedPreferencesPage),
            child: new Text("SharedPreferences"),)
        ],
      ),
    );
  }
}

void showSnackBar(context) {
  // show snackbar
  Scaffold.of(context).showSnackBar(new SnackBar(
    // set content of snackbar
    content: new Text("Hello! I am SnackBar :)"),
    // set duration
    duration: new Duration(seconds: 3),
    // set the action
    action: new SnackBarAction(
        label: "Hit Me (Action)",
        onPressed: () {
          // When action button is pressed, show another snackbar
          Scaffold.of(context).showSnackBar(new SnackBar(
            content: new Text("Hello! I am shown becoz you pressed Action :)"),
          ));
        }),
  ));
}

helloWorld() {
  return new MaterialApp(
    // Title
      title: "Using Gradient",
      // Home
      home: new Scaffold(
        // Appbar
          appBar: new AppBar(
            // Title
            title: new Text("Using Gradient"),
          ),
          // Body
          body: new Container(
            // Center the content
              child: new Center(
                // Add Text
                child: new Text(
                  "Hello World!",
                  style: new TextStyle(color: Colors.white),
                ),
              ),
              // Set background
              decoration: new BoxDecoration(
                // Add Gradient
                  gradient: commonUtil.getCustomGradient()))));
}

navigationDrawer() {
  return new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new HomeScreen(), // route for home is '/' implicitly
    routes: <String, WidgetBuilder>{
      // define the routes
      SettingsScreen.routeName: (BuildContext context) => new SettingsScreen(),
      AccountScreen.routeName: (BuildContext context) => new AccountScreen(),
    },
  );
}

class SplashScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("Splash Screen Example"),
        ),
        body: new Center(
          child: new Text("Hello World"),
        ),
      ),
    );
  }
}
