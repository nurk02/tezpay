import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tezpay/Screens/ProductDetail_screen.dart';
import 'package:tezpay/Widgets/Top_bar.dart';
import 'package:tezpay/models/MenuModel.dart';
import 'package:tezpay/presenter/menu_presenter.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:tezpay/AppConstant/Constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MenuPage extends KFDrawerContent {
  MenuPage(this.marketId);
  final int marketId;
  @override
  _MenuPageState createState() => _MenuPageState(marketId);
}

class _MenuPageState extends State<MenuPage> implements MenuPageContract {
  MenuPagePresenter _presenter;
  MenuModel _menuModel;
  int _marketId;
  _MenuPageState(int marketId) {
    _presenter = MenuPagePresenter(this);
    _marketId = marketId;
    _presenter.fetchMenuInfo(marketId: marketId, categoryId: 1);
  }

  //List<bool> menuListSelect = [];
  int menuListSelect = 0;

  @override
  void initState() {
    menuListSelect = 3;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TopBar(
              menu: widget.onMenuPressed,
            ),
            Container(
              margin: EdgeInsets.only(left: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    //margin: EdgeInsets.only(left: 10.0),
                    child: Text(
                      'TezPay',
                      style: kMenutezpay,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20.0),
              child: Text(
                'Магазин',
                style: kMenuProductsName,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20.0),
              child: DropdownButton<String>(
                  value: 'Фиркан',
                  items: <String>['Фиркан']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String value) {
                    setState(() {});
                  }),
            ),
            Container(
              margin: EdgeInsets.only(left: 20.0),
              child: Text(
                'Продукты',
                style: kMenuProductsName,
              ),
            ),
            _menuModel != null
                ? Container(
                    height: MediaQuery.of(context).size.height / 7,
                    child: ListView.builder(
                        itemCount: _menuModel.categories.category.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext ctxt, int index) {
                          return Container(
                            child: GestureDetector(
                              child: Container(
                                margin: EdgeInsets.only(left: 20),
                                //height: 100,
                                width: MediaQuery.of(context).size.width / 4.5,
                                //color: PrimaryColor,
                                decoration: new BoxDecoration(
                                    gradient: menuListSelect == index
                                        ? kMenuListSelected
                                        : kMenuListGradient2,
                                    //color:menuListSelect==index?PrimaryColor:Colors.white ,
//                            border: Border.all(
//                              color:menuListSelect==index? PrimaryColor:Colors.black26, //                   <--- border color
//                              width: 1.2,
//                            ),
                                    //color: Colors.green,
                                    borderRadius:
                                        new BorderRadius.circular(50)),
                                child: menuListSelect != index
                                    ? Container(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Container(
                                              child: Text(
                                                _menuModel.categories
                                                    .category[index].name,
                                                style: kMenuListText,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : Container(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Container(
                                              child: Text(
                                                _menuModel.categories
                                                    .category[index].name,
                                                style: kMenuListSelectedText,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                              ),
                              onTap: () {
                                setState(() {
                                  menuListSelect = index;
                                  _presenter.fetchMenuInfo(
                                    marketId: _marketId,
                                    categoryId: _menuModel
                                        .categories.category[index].id,
                                  );
                                });
                              },
                            ),
                          );
                        }),
                  )
                : Container(),
            _menuModel != null
                ? Expanded(
                    child: Container(
                      child: Container(
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height / 35,
                            right: MediaQuery.of(context).size.width / 35,
                            left: MediaQuery.of(context).size.width / 35),
                        //height: MediaQuery.of(context).size.height/1,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            topLeft: Radius.circular(20),
                          )),
                          elevation: 6.0,
                          child: Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(top: 10.0, bottom: 20),
                                child: SizedBox(
                                  height: 2,
                                  width: MediaQuery.of(context).size.width / 10,
                                  child: Container(
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              Flexible(
                                child: GridView.count(
                                  crossAxisCount: 2,
                                  childAspectRatio: .8,
                                  children: List.generate(
                                      _menuModel.products.length, (index) {
                                    return Container(
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      addDetail_screen(
                                                          _menuModel
                                                              .products[index]
                                                              .barcode)));
                                        },
                                        child: Container(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: <Widget>[
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    3,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    3,
                                                child: Card(
                                                  child: Container(
                                                    margin: EdgeInsets.all(
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            60),
                                                    child: ClipOval(
                                                      child: Image.network(
                                                        _menuModel
                                                            .products[index]
                                                            .image,
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            3.5,
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            3.5,
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                  ),
                                                  elevation: 6.0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100.0),
                                                    side: BorderSide(
                                                      color: PrimaryColor,
                                                      width: 2.0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                child: Text(
                                                  _menuModel
                                                      .products[index].name,
                                                  style: kMenuProductsName,
                                                ),
                                              ),
                                              Container(
                                                child: Text(
                                                    _menuModel.products[index]
                                                            .price
                                                            .toString() +
                                                        kAppCurrency,
                                                    style: kMenuProductsPrice),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  @override
  void onError(String error) {
    print(error);
  }

  @override
  void onSuccess(MenuModel menuModel) {
    setState(() {
      _menuModel = menuModel;
    });
  }
}
