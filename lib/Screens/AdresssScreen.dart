import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tezpay/Screens/AddnewAddress.dart';
import 'package:tezpay/AppConstant/Constants.dart';
import 'package:tezpay/Screens/paymentmethods.dart';
import 'package:tezpay/Widgets/CircularBackButton.dart';
import 'package:tezpay/models/Address.dart';
import 'package:tezpay/network/rest.dart';
import 'package:tezpay/presenter/address_presenter.dart';

import 'Payment.dart';

class AddresssScreen extends StatefulWidget {
  final int hideButton;
  AddresssScreen({this.hideButton});
  @override
  _AddresssScreenState createState() => _AddresssScreenState(hideButton);
}

class _AddresssScreenState extends State<AddresssScreen>
    implements AddressPageContract {
  int selectedAddress = 0;
  String address = "";
  List<Address> _list = [];
  int _hide = 0;
  AddressPagePresenter _presenter;
  _AddresssScreenState(int hideButton) {
    _hide = hideButton;
    _presenter = AddressPagePresenter(this);
    _presenter.fetchAddressList();
  }

  var scaffoldKey = GlobalKey<ScaffoldState>();

  void _showSnackBar(String text) {
    scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(text),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xffF1F5F8),
      //backgroundColor: Color(0xffF1F5F8),
      body: SafeArea(
          child: Container(
        child: Column(
          children: <Widget>[
            Flexible(
              child: Container(
                margin: EdgeInsets.only(top: 0.0, left: 10.0, right: 5.0),
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
                      margin: EdgeInsets.only(top: 10.0),
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        'Адрес',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0,
                          color: Colors.grey,
                          fontFamily: 'popins',
                        ),
                      ),
                    ),
                    Container(
                      child: Flexible(
                        child: ListView.builder(
                          itemCount: _list.length,
                          itemBuilder: (BuildContext ctxt, int index) {
                            return Container(
                              height: MediaQuery.of(context).size.height / 10,
                              width: MediaQuery.of(context).size.width,
                              //color: Colors.red,
                              child: GestureDetector(
                                onTap: () {
                                  print(_list[index].street);
                                  setState(() {
                                    selectedAddress = index;
                                    address = _list[index].street;
                                  });
                                },
                                child: Card(
                                  elevation: 3.0,
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: 10.0, right: 10),
                                        width: selectedAddress == index
                                            ? MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                22
                                            : MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                25,
                                        height: selectedAddress == index
                                            ? MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                22
                                            : MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                25,
                                        child: Card(
                                          elevation: 4.0,
                                          color: Colors.white,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              side: BorderSide(
                                                  color: PrimaryColor,
                                                  width: 1.5)),
                                          child: Container(
                                            margin: EdgeInsets.all(
                                                MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    200),
                                            child: FlatButton(
                                              color: selectedAddress == index
                                                  ? PrimaryColor
                                                  : Colors.white,
                                              onPressed: () {},
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 10.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            Container(
                                                child: Text(_list[index].street,
                                                    style: kAddressStreet)),
                                            Container(
                                              // margin: EdgeInsets.only(top: 5),
                                              child: Text(
                                                _list[index].kvartira,
                                                style: kAddressPost,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
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
              height: MediaQuery.of(context).size.height / 15,
              margin: EdgeInsets.only(left: 15.0, right: 15.0, top: 0.0),
              child: RaisedButton(
                color: Color(0xffFBAF03),
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(18.0),
                  side: BorderSide(color: Color(0xffFBAF03)),
                ),
                onPressed: () async {
                  //Navigator.pushNamed(context, '/FoodMenu');
                  var value = await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Addnewaddres()),
                  );
                  _presenter.fetchAddressList();
                  //FoodMenu
                },
                child: Text(
                  'Добавить новый адрес',
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
            _hide == 1
                ? Container(
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
                        if (_list.isEmpty) {
                          _showSnackBar("Добавьте адрес");
                        } else {
                          Rest().postOrderOnline(address).then((value) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Payment(
                                      value["receipt"]["payment_url"]
                                          .toString(),
                                      int.parse(
                                          value["receipt"]["id"].toString()))),
                            );
                          });
                        }
                      },
                      child: Text(
                        'Перейти к оплате',
                        style: TextStyle(
                          //color:Color(0xffFBAF03),
                          color: Colors.white,
                          fontFamily: 'popins',
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                : Container()
          ],
        ),
      )),
    );
  }

  @override
  void onError(String error) {
    // TODO: implement onError
  }

  @override
  void onSuccess(Address address) {
    // TODO: implement onSuccess
  }

  @override
  void onSuccessList(List<Address> list) {
    setState(() {
      _list.clear();
      _list.addAll(list);
      _hide = 1;
    });
  }
}
