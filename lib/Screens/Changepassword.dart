import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tezpay/Screens/profile.dart';
import 'package:tezpay/AppConstant/Constants.dart';

class changepassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return chnagepassword();
  }
}

class chnagepassword extends StatefulWidget {

  @override
  _chnagepasswordState createState() => _chnagepasswordState();
}

class _chnagepasswordState extends State<chnagepassword> {


  bool check;
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
                              Container(
                                  child: ClipOval(
                                    child: Material(
                                      elevation: 5.0,
                                      color: Colors.white, // button color
                                      child: InkWell(
                                        splashColor: PrimaryColor, // inkwell color
                                        child: SizedBox(
                                            width: MediaQuery.of(context).size.width/8,
                                            height:MediaQuery.of(context).size.width/8,
                                            child: Icon(Icons.arrow_back_ios)),
                                        onTap: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()),
                                          );
                                        },
                                      ),
                                    ),
                                  )
                                //color: Colors.red,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20.0),
                          width: MediaQuery.of(context).size.width,
                          child: Text('Change Your password',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25.0,
                              fontFamily: 'popins',
                            ),
                          ),),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height/15,
                          margin: EdgeInsets.only(left: 5.0,right: 5.0,top: 30.0),
                          child: TextField(
                            textAlign: TextAlign.start,
                            keyboardType: TextInputType.number,
                            style: TextStyle(
                                color: Colors.grey),
                            decoration: InputDecoration(
//                              fillColor: Colors.grey[300],
//                              filled: true,
                              hintText: 'Old password',
                              hintStyle: TextStyle(
                                  color: Colors.grey),
//                              border: OutlineInputBorder(
//                                borderRadius: BorderRadius.all(
//                                  const Radius.circular(100.0),
//                                ),
//                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height/15,
                          margin: EdgeInsets.only(left: 5.0,right: 5.0,top: 3.0),
                          child: TextField(
                            textAlign: TextAlign.start,
                            keyboardType: TextInputType.number,
                            style: TextStyle(
                                color: Colors.grey),
                            decoration: InputDecoration(
//                              fillColor: Colors.grey[300],
//                              filled: true,
                              hintText: 'New password',
                              hintStyle: TextStyle(
                                  color: Colors.grey),
//                              border: OutlineInputBorder(
//                                borderRadius: BorderRadius.all(
//                                  const Radius.circular(100.0),
//                                ),
//                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height/15,
                          margin: EdgeInsets.only(left: 5.0,right: 5.0,top: 3.0),
                          child: TextField(
                            textAlign: TextAlign.start,
                            keyboardType: TextInputType.number,
                            style: TextStyle(
                                color: Colors.grey),
                            decoration: InputDecoration(
//                              fillColor: Colors.grey[300],
//                              filled: true,
                              hintText: 'Confirm password',
                              hintStyle: TextStyle(
                                  color: Colors.grey),
//                              border: OutlineInputBorder(
//                                borderRadius: BorderRadius.all(
//                                  const Radius.circular(100.0),
//                                ),
//                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  //height: 50.0,
                  height: MediaQuery.of(context).size.height/15,
                  margin: EdgeInsets.only(left: 15.0,right: 15.0,top: 0.0),
                  child: RaisedButton(
                    color: Color(0xffFBAF03),
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(18.0),
                      side: BorderSide(color: Color(0xffFBAF03)),
                    ),
                    onPressed:  (){
                      //Navigator.pushNamed(context, '/FoodMenu');
//                      Navigator.push(context, MaterialPageRoute(builder: (context) => MyCart()),
//                      );
                      //FoodMenu
                    },
                    child: Text('Save',
                      style: TextStyle(
                        //color:Color(0xffFBAF03),
                        color: Colors.white,
                        fontFamily: 'popins',
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 15.0,
                ),
              ],
            ),
          )
      ),
    );
  }
}

