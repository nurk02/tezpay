import 'package:flutter/material.dart';
import 'package:tezpay/Screens/DrawerPage_screen.dart';
import 'package:tezpay/Widgets/CircularBackButton.dart';
import 'package:tezpay/models/Products.dart';
import 'package:tezpay/presenter/detail_presenter.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:tezpay/AppConstant/Constants.dart';

class addDetail_screen extends KFDrawerContent {
  String barcode;
  addDetail_screen(String id) {
    barcode = id;
  }

  @override
  _addDetail_screenState createState() => _addDetail_screenState(barcode);
}

class _addDetail_screenState extends State<addDetail_screen>
    implements DetailsPageContract {
  bool addchese = false;
  bool chesesource = false;
  bool addbacorn = false;
 
  Products _products;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  int _count = 1;

  DetailsPagePresenter _presenter;
  _addDetail_screenState(String barcode) {
    _presenter = DetailsPagePresenter(this);
    _presenter.fetchDetailsInfo(barcode);
  }
  void _showSnackBar(String text) {
    scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(text),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Container(
        color: Colors.white,
        //width: 300,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: _products != null ? Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                // color: Colors.red,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Stack(
                        children: <Widget>[
                          Container(
                            //transform: Matrix4.translationValues(50.0, 0.0,0.0),
                            height: MediaQuery.of(context).size.height / 2,
                            //width:  MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(100.0),
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(100.0),
                              ),
                              child: Image.network(
                                _products.image,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height / 50,
                                left: MediaQuery.of(context).size.width / 30),
                            child: Circular_Back_Button(
                              back: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MyApp()));
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        //color: Colors.grey,
                        height: MediaQuery.of(context).size.height / 1.5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                // height: MediaQuery.of(context).size.height/2.5,
                                //color: Colors.red,
                                margin: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height /
                                        23),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height / 12.5,
                              child: RawMaterialButton(
                                onPressed: () {
                                  setState(() {
                                    _products.count = _count;
                                  });
                                  _presenter.insertProduct(_products);
                                },
                                child: new Icon(
                                  Icons.shopping_cart,
                                  color: Colors.white,
                                  size: MediaQuery.of(context).size.height / 25,
                                ),
                                shape: new CircleBorder(),
                                elevation: 3.0,
                                fillColor: PrimaryColor,
                                padding: const EdgeInsets.all(15.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                //width: MediaQuery.of(context).size.width,
                //height: MediaQuery.of(context).size.height,
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.height / 30),
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 30),
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        _products.name,
                        style: kProductDetailHeading,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 40),
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        _products.description.toString(),
                        style: kProductDetailText,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 40),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.all(5.0),
                                      child: RawMaterialButton(
                                        onPressed: () {
                                          setState(() {
                                            _count--;
                                          });
                                        },
                                        child: new Icon(
                                          Icons.remove,
                                          color: Colors.black,
                                          size: 15.0,
                                        ),
                                        shape: new CircleBorder(),
                                        elevation: 2.0,
                                        fillColor: Colors.white,
                                        padding: const EdgeInsets.all(1.0),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                        //color: Colors.red,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Center(
                                            child: Text(
                                          _count.toString(),
                                          style: kProductDetailQuantity,
                                        ))),
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.all(5.0),
                                      child: RawMaterialButton(
                                        onPressed: () {
                                          setState(() {
                                            _count++;
                                          });
                                        },
                                        child: new Icon(
                                          Icons.add,
                                          color: Colors.black,
                                          size: 15.0,
                                        ),
                                        shape: new CircleBorder(),
                                        elevation: 2.0,
                                        fillColor: Colors.white,
                                        padding: const EdgeInsets.all(1.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              //color: Colors.green,
                              child: Text(
                                  kAppCurrency +
                                      ' ' +
                                      _products.price.toString(),
                                  textAlign: TextAlign.center,
                                  style: kProductDetailPrice),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 20.0,
                    ),
                  ],
                ),
              ),
            ],
          ) : Container(),
        ),
      ),
    );
  }

  @override
  void onError(String error) {
    // TODO: implement onError
  }

  @override
  void onSuccess(Products products) {
    setState(() {
      _products = products;
    });
  }

  @override
  void onSuccessAdded(String message) {
    _showSnackBar(message);
  }
}
