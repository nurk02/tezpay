import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tezpay/AppConstant/Constants.dart';
import 'package:tezpay/Screens/BarCode_scanner.dart';
import 'package:tezpay/Screens/Menu_screen.dart';
import 'package:tezpay/Screens/Settings.dart';
import 'package:tezpay/Screens/myOrder.dart';
import 'package:tezpay/Screens/profile.dart';
import 'package:kf_drawer/kf_drawer.dart';

//

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainWidget(),
    );
  }
}

class MainWidget extends StatefulWidget {
  MainWidget({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> with TickerProviderStateMixin {
  KFDrawerController _drawerController;

  @override
  void initState() {
    super.initState();
    _drawerController = KFDrawerController(
      initialPage: MenuPage(1),
      items: [
        KFDrawerItem.initWithPage(
          text: Container(
            margin: EdgeInsets.only(right: 30),
            child: Column(
              children: <Widget>[
                Container(
                  width: 50,
                  height: 50,
                  margin: EdgeInsets.only(bottom: 5.0),
                  child: Center(
                    child: SvgPicture.asset(
                      kHomeScreenSvg,
                      color: PrimaryColor,
                      semanticsLabel: 'A red up arrow',
                      height: 30,
                      width: 30,
                    ),
                  ),
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5.0,
                    ),
                  ], shape: BoxShape.circle, color: Colors.white),
                ),
                Center(
                    child: Text(
                  'Главная',
                  style: kDrawerElement,
                  textAlign: TextAlign.center,
                )),
              ],
            ),
          ),
          //icon: Icon(Icons.calendar_today, color: Colors.white),
          page: MenuPage(1),
        ),
        KFDrawerItem.initWithPage(
          text: Container(
            margin: EdgeInsets.only(right: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 50,
                  height: 50,
                  margin: EdgeInsets.only(bottom: 5.0),
                  child: Center(
                    child: SvgPicture.asset(
                      kHomeScreenSvgScan,
                      color: PrimaryColor,
                      semanticsLabel: 'A red up arrow',
                      height: 30,
                      width: 30,
                    ),
                  ),
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5.0,
                    ),
                  ], shape: BoxShape.circle, color: Colors.white),
                ),
                Center(
                    child: Text(
                  'Скан',
                  style: kDrawerElement,
                  textAlign: TextAlign.center,
                )),
              ],
            ),
          ),
          page: barCodes(),
        ),
        // KFDrawerItem.initWithPage(
        //   text: Container(
        //     margin: EdgeInsets.only(right: 30),
        //     child: Column(
        //       children: <Widget>[
        //         Container(
        //           width: 50,
        //           height: 50,
        //           margin: EdgeInsets.only(bottom: 5.0),
        //           child: Center(
        //             child: SvgPicture.asset(
        //               kHomeScreenSvg2,
        //               color: PrimaryColor,
        //               semanticsLabel: 'A red up arrow',
        //               height: 30,
        //               width: 30,
        //             ),
        //           ),
        //           decoration: BoxDecoration(boxShadow: [
        //             BoxShadow(
        //               color: Colors.grey,
        //               blurRadius: 5.0,
        //             ),
        //           ], shape: BoxShape.circle, color: Colors.white),
        //         ),
        //         Center(
        //             child: Text(
        //           'Продукты',
        //           style: kDrawerElement,
        //           textAlign: TextAlign.start,
        //         )),
        //       ],
        //     ),
        //   ),
        //   //icon: Icon(Icons.calendar_today, color: Colors.white),
        //   // page: MenuPage(),
        // ),
        KFDrawerItem.initWithPage(
          text: Container(
            margin: EdgeInsets.only(right: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 50,
                  height: 50,
                  margin: EdgeInsets.only(bottom: 5.0),
                  child: Center(
                    child: SvgPicture.asset(
                      kHomeScreenSvg3,
                      color: PrimaryColor,
                      semanticsLabel: 'A red up arrow',
                      height: 30,
                      width: 30,
                    ),
                  ),
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5.0,
                    ),
                  ], shape: BoxShape.circle, color: Colors.white),
                ),
                Text(
                  'Заказы',
                  style: kDrawerElement,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          //icon: Icon(Icons.calendar_today, color: Colors.white),
          page: myorders(),
        ),
        KFDrawerItem.initWithPage(
          text: Container(
            margin: EdgeInsets.only(right: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 50,
                  height: 50,
                  margin: EdgeInsets.only(bottom: 5.0),
                  child: SvgPicture.asset(
                    kHomeScreenSvg5,
                    color: PrimaryColor,
                    semanticsLabel: 'A red up arrow',
                    height: 0,
                    width: 30,
                  ),
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5.0,
                    ),
                  ], shape: BoxShape.circle, color: Colors.white),
                ),
                Text('Профиль', style: kDrawerElement),
              ],
            ),
          ),
          //icon: Icon(Icons.calendar_today, color: Colors.white),
          page: prfile(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: KFDrawer(
//        borderRadius: 0.0,
//        shadowBorderRadius: 0.0,
        menuPadding:
            EdgeInsets.only(right: MediaQuery.of(context).size.height / 5),
//        scrollable: true,
        controller: _drawerController,
        scrollable: true,

        //menuPadding: EdgeInsets.only(left: MediaQuery.of(context).size.width/30),
        footer: Container(),
        decoration: BoxDecoration(
          gradient: kDrawerGradient,
        ),
      ),
    );
  }
}
