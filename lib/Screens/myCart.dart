import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:tezpay/AppConstant/Constants.dart';
import 'package:tezpay/Screens/AdresssScreen.dart';
import 'package:tezpay/Screens/DrawerPage_screen.dart';
import 'package:tezpay/Screens/profile.dart';
import 'package:tezpay/Widgets/CircularBackButton.dart';
import 'package:tezpay/models/Products.dart';
import 'package:tezpay/presenter/order_presenter.dart';
import 'package:tezpay/presenter/scan_presenter.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:barcode_scan/barcode_scan.dart';

class My_Cart extends KFDrawerContent {
  My_Cart({
    Key key,
  });
  @override
  _My_CartState createState() => _My_CartState();
}

class _My_CartState extends State<My_Cart> implements OrderPageContract {
  OrderPagePresenter _presenter;
  List<Products> list = [];
  double totalPrice = 0.0;

  _My_CartState() {
    _presenter = OrderPagePresenter(this);
    _presenter.getProductList();
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
                margin: EdgeInsets.only(top: 10.0, left: 15.0, right: 5.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      //width: MediaQuery.of(context).size.width,
                      //color: Colors.teal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyApp()));
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width / 9,
                              height: MediaQuery.of(context).size.width / 9,
                              child: Center(child: Icon(Icons.arrow_back_ios)),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: BackGroundColor,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 5.0,
                                      offset: Offset(5.0, 5.0),
                                      spreadRadius: -3.0)
                                ],
                              ),
                            ),
                          ),
//                              Container(
//                                width: MediaQuery.of(context).size.width/9,
//                                height:MediaQuery.of(context).size.width/9,
//                                child: Center(child: Icon(Icons.search)),
//                                decoration: BoxDecoration(
//                                  shape: BoxShape.circle,
//                                  color: Colors.white,
//                                  boxShadow: [
//                                    BoxShadow(
//                                        color: Colors.grey,
//                                        blurRadius: 5.0,
//                                        offset: Offset(5.0, 5.0),
//                                        spreadRadius: -3.0)
//                                  ],
//                                ),
//                              ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20.0),
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        'Моя корзина',
                        textAlign: TextAlign.start,
                        style: kMyCartText,
                      ),
                    ),
                    Container(
                      child: Flexible(
                        child: ListView(
                          children: <Widget>[
                            Container(
                              child: ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: list.length,
                                  itemBuilder: (BuildContext ctxt, int index) {
                                    //return new Text(litems[index]);
                                    return GestureDetector(
                                      onTap: () {
//                              Navigator.push(
//                                context,
//                                MaterialPageRoute(builder: (context) => AddToCart()),
//                              );
                                      },
                                      child: Container(
                                        margin: EdgeInsets.all(
                                            MediaQuery.of(context).size.height /
                                                120),
                                        child: Slidable(
                                          actionPane:
                                              SlidableDrawerActionPane(),
                                          actionExtentRatio: 0.17,
                                          child: Container(
                                            //color: Colors.white,
                                            child: Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  6,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey,
                                                    blurRadius:
                                                        9.0, // has the effect of softening the shadow
                                                    spreadRadius:
                                                        -4.0, // has the effect of extending the shadow
                                                    offset: Offset(
                                                      5.0, // horizontal, move right 10
                                                      5.0, // vertical, move down 10
                                                    ),
                                                  )
                                                ],
                                              ),
                                              margin: EdgeInsets.only(
                                                  right: 5.0,
                                                  left: 25.0,
                                                  top: 0.0),
                                              child: Container(
                                                //color: Colors.red,
                                                child: Row(
                                                  children: <Widget>[
                                                    //image container
                                                    Container(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height /
                                                              7.3,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height /
                                                              7.3,
                                                      //color: Colors.green,
                                                      transform: Matrix4
                                                          .translationValues(
                                                              -45.0, 0.0, 0.0),
                                                      child: Card(
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      100.0),
                                                          side: BorderSide(
                                                            color: PrimaryColor,
                                                            width: 2.0,
                                                          ),
                                                        ),
                                                        child: Container(
                                                          margin:
                                                              EdgeInsets.all(
                                                            MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width /
                                                                90,
                                                          ),
                                                          child: ClipOval(
                                                              child:
                                                                  Image.network(
                                                            list[index]
                                                                .image
                                                                .toString(),
                                                            fit: BoxFit.contain,
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height /
                                                                7.3,
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width /
                                                                4.1,
                                                          )),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      //color: Colors.red,
                                                      transform: Matrix4
                                                          .translationValues(
                                                              -40.0, 0.0, 0.0),
                                                      //width: MediaQuery.of(context).size.width,
                                                      // margin: EdgeInsets.only(left: 10.0),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: <Widget>[
                                                          Container(
                                                            //width: MediaQuery.of(context).size.width,
                                                            // margin: EdgeInsets.only(top: 10),
                                                            child: Text(
                                                                list[index]
                                                                    .name,
                                                                style:
                                                                    kMyCartItemHeading),
                                                          ),
                                                          Container(
                                                            //color: Colors.red,
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height /
                                                                20,
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width /
                                                                2,
                                                            //margin: EdgeInsets.only(top: 10),
                                                            child: Row(
                                                              children: <
                                                                  Widget>[
                                                                Expanded(
                                                                  child: Container(
                                                                      //color: Colors.red,
                                                                      width: MediaQuery.of(context).size.width,
                                                                      child: Text(
                                                                        "Количество: " +
                                                                            list[index].count.toString(),
                                                                        style:
                                                                            kMyCartItemHeading,
                                                                      )),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Container(
                                                            // margin: EdgeInsets.only(top: 10),
                                                            child: Text(
                                                                kAppCurrency +
                                                                    " ${list[index].price}",
                                                                //litems[index],
                                                                style:
                                                                    kMyCartItemPrice),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          secondaryActions: <Widget>[
                                            IconSlideAction(
                                              caption: 'Удалить',
                                              color: Delete,
                                              icon: Icons.delete,
                                              onTap: () {
                                                _presenter.deleteProduct(
                                                    list[index].order_id);
                                                setState(() {
                                                  totalPrice = totalPrice -
                                                      list[index].price;
                                                  list.removeAt(index);
                                                });
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  top: 20.0, right: 20.0, bottom: 10),
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: Text('Сумма',
                                        textAlign: TextAlign.end,
                                        style: kMyCartItemTotal),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: Text(
                                      kAppCurrency +
                                          ' ' +
                                          totalPrice.toString(),
                                      textAlign: TextAlign.end,
                                      style: kMyCartItemTotalPrice,
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
                onPressed: () {
                  if (list.isEmpty) {
                    _showSnackBar("Пожалуйста, добавьте товар в корзину");
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddresssScreen(hideButton: 0,)),
                    );
                  }
                },
                child: Text('Перейти к заказу', style: kMyCartPlaceOrder),
              ),
            ),
            SizedBox(
              height: 10,
            ),
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
  void onSuccess(Products products) {
    setState(() {
      _presenter.insertProduct(products);
      _presenter.getProductList();
      totalPrice += products.price;
    });
  }

  _totalPriceCalculate() {
    setState(() {
      totalPrice = 0;
      list.forEach((element) {
        totalPrice = (element.price * element.count) + totalPrice;
      });
    });
  }

  @override
  void onSuccessList(List<Products> products) {
    setState(() {
      list.clear();
      list.addAll(products);
      totalPrice = 0;
      products.forEach((element) {
        totalPrice = (element.price * element.count) + totalPrice;
      });
    });
  }

  @override
  void onSuccessDeleted() {
    _presenter.getProductList();
  }

  @override
  void onSuccessInserted() {
    _presenter.getProductList();
  }
}
