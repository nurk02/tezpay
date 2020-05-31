import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tezpay/AppConstant/Constants.dart';
import 'package:tezpay/Screens/myOrder.dart';
import 'package:tezpay/Screens/profile.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tezpay/Widgets/CircularBackButton.dart';
import 'package:tezpay/models/ReceiptOrderResponse.dart';
import 'package:tezpay/presenter/receipt_presenter.dart';
import 'package:qr_flutter/qr_flutter.dart';

class OrderStatus extends StatefulWidget {
  final int id;
  OrderStatus(this.id);

  @override
  _OrderStatusState createState() => _OrderStatusState(id);
}

class _OrderStatusState extends State<OrderStatus>
    implements ReceiptPageContract {
  bool check;

  ReceiptOrderResponse _model;

  ReceiptPagePresenter _presenter;
  _OrderStatusState(int id) {
    _presenter = ReceiptPagePresenter(this);
    _presenter.fetchReceiptInfo(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF1F5F8),
      //backgroundColor: Color(0xffF1F5F8),
      body: SafeArea(
          child: Container(
        child: Column(
          children: <Widget>[
            _model != null
                ? Flexible(
                    child: Container(
                      margin:
                          EdgeInsets.only(top: 10.0, left: 10.0, right: 5.0),
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Circular_Back_Button(back: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MyOrder()));
                                }),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10.0),
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              'Детали',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25.0,
                                fontFamily: 'popins',
                              ),
                            ),
                          ),
                          QrImage(
                            data: _model.receipt.id.toString(),
                            version: QrVersions.auto,
                            size: 200.0,
                          ),
                          Text(
                            "Сумма: " + _model.receipt.price.toString(),
                            style: kMyOrdersNumber,
                          ),
                          SizedBox(height: 15),
                          Expanded(
                            child: ListView.builder(
                                itemCount: _model.orders.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    color: Colors.white,
                                    child: ListTile(
                                      title: Text(_model
                                          .orders[index].product.name
                                          .toString()),
                                      subtitle: Text("Кол-во: " +
                                          _model.orders[index].count
                                              .toString()),
                                    ),
                                  );
                                }),
                          )
                        ],
                      ),
                    ),
                  )
                : Container(),
            Container(
              height: 15.0,
            ),
          ],
        ),
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
