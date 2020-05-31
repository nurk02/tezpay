import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tezpay/AppConstant/Constants.dart';
import 'package:tezpay/Screens/Intro_sslider.dart';
import 'package:tezpay/database/database_helper.dart';
import 'package:tezpay/models/User.dart';

import 'Screens/DrawerPage_screen.dart';
import 'Screens/SecurityPage.dart';

// void main() => runApp(MyApp());

void main() {
  DatabaseHelper();
  runApp(MaterialApp(
    home: new tezpay(),
    debugShowCheckedModeBanner: false,
    routes: <String, WidgetBuilder>{
      '/FoodMenu': (BuildContext context) => new RTLMain(),
      '/login': (BuildContext context) => new FoodMenu(),
      '/main': (BuildContext context) => new MyApp(),
      '/security': (BuildContext context) => new SecurityApp(),
    },
  ));
}

class tezpay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RTLMain();
  }
}

class RTLMain extends StatefulWidget {
  @override
  _RTLMainState createState() => new _RTLMainState();
}

class _RTLMainState extends State<RTLMain> {
  startTime() async {
    var _duration = new Duration(seconds: 4);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() async {
    var checked = await DatabaseHelper().checkUser();
    if (checked) {
      User user = await DatabaseHelper().getUser();
      if (user.type == "security") {
        Navigator.of(context).pushReplacementNamed('/security');
      } else {
        Navigator.of(context).pushReplacementNamed('/main');
      }
    } else
      Navigator.of(context).pushReplacementNamed('/login');
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: Image.asset(kSplashScreenLogo),
        ),
      ),
    );
  }
}
