import 'dart:ui';
import 'package:barcode_scan/platform_wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tezpay/AppConstant/Constants.dart';
import 'package:tezpay/Screens/myOrder.dart';
import 'package:tezpay/Screens/profile.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tezpay/Widgets/CircularBackButton.dart';
import 'package:tezpay/database/database_helper.dart';
import 'package:tezpay/models/ReceiptOrderResponse.dart';
import 'package:tezpay/presenter/receipt_presenter.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'LoginPassword.dart';

class SecurityApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SecurityPage(),
    );
  }
}

class SecurityPage extends StatefulWidget {
  @override
  _SecurityPageState createState() => _SecurityPageState();
}

class _SecurityPageState extends State<SecurityPage>
    implements ReceiptPageContract {
  bool check;

  ReceiptOrderResponse _model;

  ReceiptPagePresenter _presenter;
  _SecurityPageState() {
    _presenter = ReceiptPagePresenter(this);
    // _presenter.fetchReceiptInfo(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF1F5F8),
      //backgroundColor: Color(0xffF1F5F8),
      body: SafeArea(
          child: Container(
        child: ListView(children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 10.0),
            width: MediaQuery.of(context).size.width,
            child: Text(
              'Чек',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
                fontFamily: 'popins',
              ),
            ),
          ),
          _model != null
              ? Column(children: [
                  QrImage(
                    data: _model.receipt.receiptId.toString(),
                    version: QrVersions.auto,
                    size: 200.0,
                  ),
                  Text(
                    "Сумма: " + _model.receipt.price.toString(),
                    style: kMyOrdersNumber,
                  ),
                  Text(
                    "Оплачено: " + _model.receipt.payed,
                    style: kMyOrdersNumber,
                  ),
                  SizedBox(height: 15),
                  Container(
                    height: 300,
                    child: ListView.builder(
                        itemCount: _model.orders.length,
                        itemBuilder: (context, index) {
                          return Container(
                            color: Colors.white,
                            child: ListTile(
                              title: Text(
                                  _model.orders[index].product.name.toString()),
                              subtitle: Text("Кол-во: " +
                                  _model.orders[index].count.toString()),
                            ),
                          );
                        }),
                  ),
                ])
              : Expanded(child: Container()),
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
                var result = await BarcodeScanner.scan();
                _presenter.fetchReceiptInfo(int.parse(result.rawContent));
              },
              child: Text('Проверить', style: kMyCartPlaceOrder),
            ),
          ),
          SizedBox(
            height: 10,
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
                var db = DatabaseHelper();
                db.dropAll();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPassword()),
                    (Route<dynamic> route) => false);
              },
              child: Text('Выйти', style: kMyCartPlaceOrder),
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ]),
      )),
    );
  }

  @override
  void onError(String error) {}

  @override
  void onSuccess(ReceiptOrderResponse model) {
    setState(() {
      _model = model;
    });
  }
}
