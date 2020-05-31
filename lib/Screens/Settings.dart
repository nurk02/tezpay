import 'package:flutter/material.dart';
import 'package:tezpay/Screens/Changepassword.dart';
import 'package:tezpay/Screens/information.dart';
import 'package:tezpay/Screens/profile.dart';
import 'package:tezpay/Widgets/CircularBackButton.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:tezpay/AppConstant/Constants.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return setting();
  }
}
class setting extends KFDrawerContent {
  setting({
    Key key,
  });
  @override
  _settingState createState() => _settingState();
}

class _settingState extends State<setting> {
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
                    margin: EdgeInsets.only(top: 10.0,left: 10.0,right: 5.0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Circular_Back_Button(back: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()));
                              }
                              ),

                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20.0),
                          width: MediaQuery.of(context).size.width,
                          child: Text('Settings',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25.0,
                              fontFamily: 'popins',
                            ),
                          ),),
                        Container(
                          margin: EdgeInsets.only(top: 10.0),
                          color: Colors.grey,
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height/16,
                          child:  Center(
                            child: Text('User information',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontFamily: 'popins',
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10.0,right: 10.0),
                          color: Colors.white,
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height/12,
                          child:  Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              GestureDetector(
                                child: Container(
                                  child: Text('Information & Contact',
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontFamily: 'popins',
                                    ),
                                  ),),
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => Information()),
                                  );
                                },
                              ),
                              Container(
                                child: Icon(Icons.arrow_forward_ios,size: 20.0,)),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 2.0),
                          padding: EdgeInsets.only(left: 10.0,right: 10.0),
                          color: Colors.white,
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height/12,
                          child:  Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              GestureDetector(
                                child: Container(
                                  child: Text('Change Pasword',
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontFamily: 'popins',
                                    ),
                                  ),),
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => changepassword()),
                                  );
                                },
                              ),
                              Container(
                                child: Icon(Icons.arrow_forward_ios,size: 20.0,)),
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.grey,
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height/16,
                          child:  Center(
                            child: Text('App settings',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontFamily: 'popins',
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10.0,right: 10.0),
                          color: Colors.white,
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height/12,
                          child:  Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child: Text('App Version',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontFamily: 'popins',
                                  ),
                                ),),
                              Container(
                                child: Text('1.0.1',
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.grey,
                                    fontFamily: 'popins',
                                  ),
                                ),),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                ),

              ],
            ),
          )
      ),
    );
  }
}
