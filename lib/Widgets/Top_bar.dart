import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tezpay/AppConstant/Constants.dart';
import 'package:tezpay/Screens/myCart.dart';
import 'package:kf_drawer/kf_drawer.dart';

class TopBar extends StatelessWidget {
  TopBar({this.menu});

  Function menu;
  String dropdownValue = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 19,
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 80),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(60.0)),
              child: Material(
                  shadowColor: Colors.transparent,
                  color: Colors.transparent,
                  child: GestureDetector(
                    onTap: menu,
                    child: Center(
                        child: SvgPicture.asset(
                      'images/svg/menu1.svg',
                      width: 30.0,
                      color: PrimaryColor,
                    )),
                  )),
            ),
          ),
         
          Container(
            width: MediaQuery.of(context).size.height / 19,
            height: MediaQuery.of(context).size.height / 19,
            margin:
                EdgeInsets.only(right: MediaQuery.of(context).size.height / 60),
            child: ClipOval(
              //borderRadius: BorderRadius.all(Radius.circular(60.0)),
              child: Material(
                  shadowColor: PrimaryColor,
                  color: PrimaryColor,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => My_Cart()));
                    },
                    child: Center(
                      child: Container(
                          margin: EdgeInsets.all(
                              MediaQuery.of(context).size.height / 100),
                          child: SvgPicture.asset(
                            'images/svg/shopping-cart.svg',
                            width: MediaQuery.of(context).size.height / 6,
                            height: MediaQuery.of(context).size.height / 6,
                            color: Colors.white,
                          )),
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
