import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tezpay/AppConstant/Constants.dart';

import 'package:tezpay/Screens/LoginPassword.dart';
import 'package:tezpay/Screens/SignupScreen.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BackGroundColor,
      body: Stack(
        children: <Widget>[
          Container(
            color: Color(0xffFBAF03),
            height: MediaQuery.of(context).size.height / 1.4,
            width: double.infinity,
            child: Hero(
              tag: "image",
              child: Image.asset(
                kWelcomeScreenBackgroundImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            child: Opacity(
              opacity: 0,
              child: Container(
                color: PrimaryColor,
                height: MediaQuery.of(context).size.height / 1.4,
              ),
            ),
          ),
          Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(
                    left: 25.0,
                    right: 25.0,
                    top: MediaQuery.of(context).size.height / 18),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 2.2,
                padding: EdgeInsets.all(10.0),
//

                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 12,
                    left: 10,
                    right: 10),
                width: double.infinity,
                child: Card(
                  elevation: 6.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Container(
                    //height: MediaQuery.of(context).size.height/2.2,
                    margin: EdgeInsets.only(
                      left: 25.0,
                      right: 25.0,
                      bottom: 0,
                    ),
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 15.0),
                          child: SvgPicture.asset(
                            kWelcomeScreenSvg1,
                            width: 40.0,
                            color: PrimaryColor,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 15.0),
                          child: Text(
                            'TEZPay',
                            style: kWelcomeText,
                          ),
                        ),
                        // Container(
                        //   margin: EdgeInsets.only(
                        //       left: 10.0, right: 10.0, top: 20.0),
                        //   //height: 40.0,
                        //   height: MediaQuery.of(context).size.height / 17,
                        //   child: RaisedButton(
                        //     //padding: EdgeInsets.all(5),
                        //     //color: Colors.green,
                        //     color: BackGroundColor,
                        //     highlightColor: Colors.green[300],
                        //     elevation: 6.0,
                        //     shape: RoundedRectangleBorder(
                        //       borderRadius: new BorderRadius.circular(100.0),
                        //       side: BorderSide(color: Colors.green, width: 2.0),
                        //     ),
                        //     onPressed: () {
                        //       //Navigator.pushNamed(context, '/FoodMenu');
                        //       Navigator.push(
                        //         context,
                        //         MaterialPageRoute(
                        //             builder: (context) => Login()),
                        //       );
                        //       //FoodMenu
                        //     },
                        //     child: Row(
                        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //       children: <Widget>[
                        //         Expanded(child: Container()),
                        //         Expanded(
                        //             flex: 2,
                        //             child: Container(
                        //               child: Center(
                        //                 child: Text(
                        //                   'СМС на Телефон',
                        //                   textAlign: TextAlign.center,
                        //                   style: kWelcomeScreenPhone,
                        //                 ),
                        //               ),
                        //             )),
                        //         Expanded(
                        //             child: Container(
                        //           margin: EdgeInsets.only(left: 30.0),
                        //           child: SvgPicture.asset(kWelcomeScreenSvg2),
                        //           //Icon(Icons.phone,color: Colors.green,size: 25.0,) ,//Image.asset('image/right.png',height:25.0,color: Colors.white,),
                        //         )),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        Container(
                          margin: EdgeInsets.only(
                              left: 10.0, right: 10.0, top: 15.0, bottom: 0.0),
                          //height:40.0,

                          height: MediaQuery.of(context).size.height / 17,
                          child: RaisedButton(
                            color: BackGroundColor,
                            elevation: 6.0,
                            highlightColor: Colors.blue[200],
                            shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(100.0),
                              side: BorderSide(
                                  color: Colors.blue[500], width: 2.0),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPassword()),
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Expanded(
                                    flex: 2,
                                    child: Container(
                                      child: Center(
                                        child: Text(
                                          'Войти',
                                          style: kWelcomeScreenFb,
                                        ),
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          //width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.only(
                              left: 10.0, right: 10.0, top: 15.0, bottom: 0.0),

                          height: MediaQuery.of(context).size.height / 17,
                          child: RaisedButton(
                            elevation: 6.0,
                            color: BackGroundColor,
                            highlightColor: Colors.red[200],
                            shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(100.0),
                              side: BorderSide(
                                  color: Colors.green[400], width: 2.0),
                            ),
                            onPressed: () {
                               Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignupScreen()),
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Expanded(
                                    flex: 2,
                                    child: Container(
                                      child: Center(
                                        child: Text(
                                          'Регистрация',
                                          style: kWelcomeScreenPhone,
                                        ),
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
//
    );
  }
}
