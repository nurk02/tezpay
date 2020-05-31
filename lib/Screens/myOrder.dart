import 'package:flutter/material.dart';
import 'package:tezpay/AppConstant/Constants.dart';
import 'package:tezpay/Screens/DrawerPage_screen.dart';
import 'package:tezpay/Screens/MyOrder_listView_screen.dart';
import 'package:tezpay/Screens/profile.dart';
import 'package:tezpay/Widgets/CircularBackButton.dart';
import 'package:kf_drawer/kf_drawer.dart';

class MyOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return myorders();
  }
}

class myorders extends KFDrawerContent {
  myorders({
    Key key,
  });
  @override
  _myordersState createState() => _myordersState();
}

class _myordersState extends State<myorders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF1F5F8),
      //backgroundColor: Color(0xffF1F5F8),
      body: SafeArea(
          child: Container(
        child: Column(
          children: <Widget>[
            Flexible(
              child: Container(
                margin: EdgeInsets.only(top: 10.0, left: 10.0, right: 5.0),
                child: Column(
                  children: <Widget>[
                    Circular_Back_Button(
                      back: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => MyApp()));
                      },
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 10.0),
                            //width: MediaQuery.of(context).size.width,
                            child: Text(
                              'Мои заказы',
                              // textAlign: TextAlign.start,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25.0,
                                fontFamily: 'popins',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            height: MediaQuery.of(context).size.height/1.3,
                            width: MediaQuery.of(context).size.width,
                            child: DefaultTabController(
                              length: 3,
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    height:
                                        MediaQuery.of(context).size.height / 20,
                                    //color: PrimaryColor,
                                    child: TabBar(
                                      //controller: TabController(length: 6, vsync: null),
                                      labelColor: PrimaryColor,
                                      isScrollable: true,
                                      unselectedLabelColor:
                                          Colors.black.withOpacity(0.3),
                                      indicatorColor: PrimaryColor,
                                      labelStyle: kMyOrdersTabBarSelected,
                                      unselectedLabelStyle:
                                          kMyOrdersTabBarUnSelected,
                                      tabs: <Widget>[
                                        Container(
                                            child: Text(
                                          'Oнлайн',
                                        )),
                                        Container(
                                            child: Text(
                                          'В магазине',
                                          textAlign: TextAlign.center,
                                        )),
                                        Container(
                                          child: Text(
                                            'Завершенные',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height,
                                      child: TabBarView(
                                        children: <Widget>[
                                          Container(
                                              child: ListviewOrder(type: 1)),
                                          Container(
                                              child: ListviewOrder(type: 2)),
                                          Container(
                                              child: ListviewOrder(type: 3)),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
