import 'package:flutter/material.dart';
import 'package:tezpay/Screens/orderstatus.dart';
import 'package:tezpay/AppConstant/Constants.dart';
import 'package:tezpay/models/Receipt.dart';
import 'package:tezpay/network/rest.dart';

class ListviewOrder extends StatelessWidget {
  final int type;
  ListviewOrder({this.type});
  @override
  Widget build(BuildContext context) {
    return ListViewTabBar(type);
  }
}

class ListViewTabBar extends StatefulWidget {
  final int type;

  ListViewTabBar(this.type);

  @override
  _ListViewTabBarState createState() => _ListViewTabBarState();
}

class _ListViewTabBarState extends State<ListViewTabBar> {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Rest().getOrders(widget.type),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data != null) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return GestureDetector(
                      onTap: () {
//              Navigator.push(
//                context,
//                //MaterialPageRoute(builder: (context) => PageView_resturant()),
//                MaterialPageRoute(builder: (context) => addDetailsScreen()),
//              );
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 4.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(10.0),
                              //color: PrimaryColor,
                              height: MediaQuery.of(context).size.height / 6,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    child: Text(
                                      snapshot.data[index].id.toString(),
                                      style: kMyOrdersNumber,
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2.5,
                                    child: Text(
                                      snapshot.data[index].price.toString(),
                                      textAlign: TextAlign.start,
                                      style: kMyOrdersDate,
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2.2,
                                    child: Text(
                                     snapshot.data[index].time,
                                      textAlign: TextAlign.start,
                                      style: kMyOrdersTime,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 4,
                              //height: 50.0,
                              height: MediaQuery.of(context).size.height / 25,
                              margin: EdgeInsets.only(
                                  left: 15.0, right: 15.0, top: 0.0),
                              child: RaisedButton(
                                //color: Color(0xffFBAF03),
                                elevation: 4.0,
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(20.0),
                                  side: BorderSide(
                                      color: PrimaryColor, width: 1.5),
                                ),
                                onPressed: () {
                                  //Navigator.pushNamed(context, '/FoodMenu');
                                  print(snapshot.data[index].id);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => OrderStatus(snapshot.data[index].id))
                                  );
                                  //FoodMenu
                                },
                                child: Text(
                                  'Детали',
                                  style: kMyOrdersDetails,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            } else {
              return new CircularProgressIndicator();
            }
          } else {
            return Container();
          }
        });
  }
}
