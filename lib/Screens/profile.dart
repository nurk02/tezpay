import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tezpay/AppConstant/Constants.dart';
import 'package:tezpay/Screens/AdresssScreen.dart';
import 'package:tezpay/Screens/DrawerPage_screen.dart';
import 'package:tezpay/Screens/LoginPassword.dart';
import 'package:tezpay/Screens/Settings.dart';
import 'package:tezpay/Screens/information.dart';
import 'package:tezpay/Screens/orderstatus.dart';
import 'package:tezpay/Screens/paymentmethods.dart';
import 'package:tezpay/Widgets/CircularBackButton.dart';
import 'package:tezpay/database/database_helper.dart';
import 'package:tezpay/models/User.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:url_launcher/url_launcher.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return prfile();
  }
}

class prfile extends KFDrawerContent {
  prfile({
    Key key,
  });
  @override
  _prfileState createState() => _prfileState();
}

class _prfileState extends State<prfile> {
  User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height / 3,
          width: MediaQuery.of(context).size.width,
          child: Container(
              //margin: EdgeInsets.all(MediaQuery.of(context).size.height/20),
//                width: MediaQuery.of(context).size.width,
//                height: MediaQuery.of(context).size.height,
              // color: PrimaryColor.withOpacity(0.8),
              child: Image.network(
            'https://www.nicepng.com/png/detail/186-1866063_dicks-out-for-harambe-sample-avatar.png',
            width: MediaQuery.of(context).size.height / 20,
            height: MediaQuery.of(context).size.height / 20,
          )),
        ),
        Opacity(
          opacity: .6,
          child: Container(
            color: PrimaryColor,
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width,
            child: Container(
                //margin: EdgeInsets.all(MediaQuery.of(context).size.height/20),
//                width: MediaQuery.of(context).size.width,
//                height: MediaQuery.of(context).size.height,
                // color: PrimaryColor.withOpacity(0.8),

                ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height / 50,
              left: MediaQuery.of(context).size.width / 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Circular_Back_Button(
                back: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyApp()));
                },
              ),
            ],
          ),
        ),
        Container(
          //margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/5,left:MediaQuery.of(context).size.width/20 ,right:MediaQuery.of(context).size.width/20),
          height: MediaQuery.of(context).size.height / 1.5,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 4.5,
                    left: MediaQuery.of(context).size.width / 20,
                    right: MediaQuery.of(context).size.width / 20),
                height: MediaQuery.of(context).size.height / 5.2,
                width: MediaQuery.of(context).size.width / 1.1,
                child: Card(
                  elevation: 6.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 15),
                    child: Column(
                      children: <Widget>[
                        Container(
                            child: FutureBuilder<User>(
                          future: DatabaseHelper().getUserProfile(),
                          builder: (context, snapshot) {
                            if (snapshot.data != null &&
                                snapshot.connectionState ==
                                    ConnectionState.done) {
                              return Text(
                                snapshot.data.username.toString(),
                                style: kProfileName,
                              );
                            } else {
                              return Text(
                                '',
                                style: kProfileName,
                              );
                            }
                          },
                          initialData: User(username: 's'),
                        )),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 6.5,
                    left: MediaQuery.of(context).size.width / 2.7,
                    right: MediaQuery.of(context).size.width / 2.7),
                height: MediaQuery.of(context).size.height / 8,
                width: MediaQuery.of(context).size.height / 8,
                child: Card(
                  elevation: 6.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(
                        "https://www.nicepng.com/png/detail/186-1866063_dicks-out-for-harambe-sample-avatar.png"),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          //height: MediaQuery.of(context).size.height/4,
          margin:
              EdgeInsets.only(top: MediaQuery.of(context).size.height / 2.2),
          //color: Colors.red,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      child: Container(
                        //color:Colors.red,
                        height: MediaQuery.of(context).size.height / 6.5,
                        width: MediaQuery.of(context).size.width / 3,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 4.0,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                  child: SvgPicture.asset(
                                'images/svg/credit-card.svg',
                                width: 30.0,
                                color: PrimaryColor,
                              )),
                              Container(
                                  child: Text(
                                'Платежи',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'popins',
                                  fontSize: 18.0,
                                ),
                              )),
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PaymentMethod()),
                        );
                        //
                      },
                    ),
                    GestureDetector(
                        child: Container(
                          //color:Colors.red,
                          height: MediaQuery.of(context).size.height / 6.5,
                          width: MediaQuery.of(context).size.width / 3.0,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 4.0,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Container(
                                    child: SvgPicture.asset(
                                  'images/svg/address.svg',
                                  width: 30.0,
                                  color: PrimaryColor,
                                )),
                                Container(
                                    child: Text(
                                  'Адрес',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'popins',
                                    fontSize: 18.0,
                                  ),
                                )),
                              ],
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddresssScreen(hideButton: 0,)),
                          );
                        }),
                    // GestureDetector(
                    //     child: Container(
                    //       //color:Colors.red,
                    //       height: MediaQuery.of(context).size.height / 6.5,
                    //       width: MediaQuery.of(context).size.width / 3,
                    //       child: Card(
                    //         shape: RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.circular(10),
                    //         ),
                    //         elevation: 4.0,
                    //         child: Column(
                    //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //           children: <Widget>[
                    //             Container(
                    //                 child: SvgPicture.asset(
                    //               'images/svg/general-mail.svg',
                    //               width: 30.0,
                    //               color: PrimaryColor,
                    //             )),
                    //             Container(
                    //                 child: Text(
                    //               'General\n Details',
                    //               textAlign: TextAlign.center,
                    //               style: TextStyle(
                    //                 fontFamily: 'popins',
                    //                 fontSize: 18.0,
                    //               ),
                    //             )),
                    //           ],
                    //         ),
                    //       ),
                    //     ),
                    //     onTap: () {
                    //       Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //             builder: (context) => Information()),
                    //       );
                    //     }),
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // Container(
                    //   //color:Colors.red,
                    //   height: MediaQuery.of(context).size.height / 6.5,
                    //   width: MediaQuery.of(context).size.width / 3,
                    //   child: GestureDetector(
                    //     child: Card(
                    //       shape: RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.circular(10),
                    //       ),
                    //       elevation: 4.0,
                    //       child: Column(
                    //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //         children: <Widget>[
                    //           Container(
                    //               child: SvgPicture.asset(
                    //             'images/svg/gears.svg',
                    //             width: 30.0,
                    //             color: PrimaryColor,
                    //           )),
                    //           Container(
                    //               child: Text(
                    //             'Settings',
                    //             textAlign: TextAlign.center,
                    //             style: TextStyle(
                    //               fontFamily: 'popins',
                    //               fontSize: 18.0,
                    //             ),
                    //           )),
                    //         ],
                    //       ),
                    //     ),
                    //     onTap: () {
                    //       Navigator.push(
                    //         context,
                    //         MaterialPageRoute(builder: (context) => Settings()),
                    //       );
                    //     },
                    //   ),
                    // ),
                    InkWell(
                      onTap: () async {
                        const url = 'tel:+77471917706';
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                      child: Container(
                        //color:Colors.red,
                        height: MediaQuery.of(context).size.height / 6.5,
                        width: MediaQuery.of(context).size.width / 3.0,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 4.0,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                  child: SvgPicture.asset(
                                'images/svg/support.svg',
                                width: 30.0,
                                color: PrimaryColor,
                              )),
                              Container(
                                  child: Text(
                                'Тех поддержка',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'popins',
                                  fontSize: 18.0,
                                ),
                              )),
                            ],
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        var db = DatabaseHelper();
                        db.dropAll();
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => LoginPassword()),
                            (Route<dynamic> route) => false);
                      },
                      child: Container(
                        //color:Colors.red,
                        height: MediaQuery.of(context).size.height / 6.5,
                        width: MediaQuery.of(context).size.width / 3,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 4.0,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                  child: SvgPicture.asset(
                                'images/svg/logout.svg',
                                width: 30.0,
                                color: PrimaryColor,
                              )),
                              Container(
                                  child: Text(
                                'Выйти',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'popins',
                                  fontSize: 18.0,
                                ),
                              )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
