import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tezpay/Screens/profile.dart';
import 'package:tezpay/AppConstant/Constants.dart';
import 'package:tezpay/Widgets/CircularBackButton.dart';
import 'package:tezpay/database/database_helper.dart';
import 'package:tezpay/models/Address.dart';

class Addnewaddres extends StatefulWidget {
  @override
  _AddnewaddresState createState() => _AddnewaddresState();
}

class _AddnewaddresState extends State<Addnewaddres> {
  var streetField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF1F5F8),
      //backgroundColor: Color(0xffF1F5F8),
      body: SafeArea(
          child: Container(
        child: ListView(
          children: <Widget>[
            Flexible(
              child: Container(
                margin: EdgeInsets.only(top: 10.0, left: 10.0, right: 5.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Circular_Back_Button(
                            back: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20.0),
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        'Добавить новый адрес',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0,
                          fontFamily: 'popins',
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 15,
                      margin: EdgeInsets.only(left: 5.0, right: 5.0, top: 30.0),
                      child: TextField(
                        controller: streetField,
                        textAlign: TextAlign.start,
                        keyboardType: TextInputType.text,
                        style: TextStyle(color: Colors.grey),
                        decoration: InputDecoration(
//                              fillColor: Colors.grey[300],
//                              filled: true,
                          hintText: 'Улица/Адрес',
                          hintStyle: TextStyle(color: Colors.grey),
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
              height: 30.0,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              //height: 50.0,
              height: MediaQuery.of(context).size.height / 15,
              margin: EdgeInsets.only(left: 15.0, right: 15.0, top: 0.0),
              child: RaisedButton(
                color: Color(0xffFBAF03),
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(18.0),
                  side: BorderSide(color: Color(0xffFBAF03)),
                ),
                onPressed: () {
                  Address address = new Address(
                      house: "",
                      kvartira: "",
                      podezd: "",
                      street: streetField.text);
                  DatabaseHelper()
                      .insertAddress(address)
                      .then((value) => Navigator.pop(context));
                },
                child: Text(
                  'Сохранить',
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
          ],
        ),
      )),
    );
  }
}
