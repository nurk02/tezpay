import 'package:flutter/material.dart';
import 'package:tezpay/AppConstant/Constants.dart';
import 'package:tezpay/Screens/DrawerPage_screen.dart';

class Circular_Back_Button extends StatelessWidget {

  Circular_Back_Button({@required this.back});

  final Function back;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
              child: ClipOval(
                child: Card(
                  elevation: 6.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width/9),
                  ),
                  // button color
                  child: InkWell(
                    splashColor: PrimaryColor, // inkwell color
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width/9,
                        height:MediaQuery.of(context).size.width/9,
                        child: Icon(Icons.arrow_back_ios)),
                    onTap: back,
                  ),
                ),
              )
            //color: Colors.red,
          ),
        ],
      ),
    );
  }
}