

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tezpay/AppConstant/Constants.dart';
import 'package:tezpay/Screens/DrawerPage_screen.dart';

class CurrentLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: GetCurrentLocation(),
        backgroundColor: BackGroundColor,
      ),
    );
  }
}

class GetCurrentLocation extends StatefulWidget {
  @override
  _GetCurrentLocationState createState() => _GetCurrentLocationState();
}

class _GetCurrentLocationState extends State<GetCurrentLocation> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Container(
                child: Center(
                  child: SvgPicture.asset(kLocationScreenSvg,
                    semanticsLabel: 'A red up arrow',),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Text('Hi! Nice to meet you',style: kLocationScreenHeading,textAlign:TextAlign.center,),
                    ),
                    Container(
                      child: Text('Please allow your location \n to continue using app',style: kLocationScreenDescription,textAlign:TextAlign.center,),
                    ),

                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Flexible(

                      child: Container(

                        //color: Colors.black87,
                        //padding: EdgeInsets.symmetric(vertical: 10,horizontal: 45),
                        width: MediaQuery.of(context).size.width/1.3,
                        height: MediaQuery.of(context).size.width/7,
                        child: OutlineButton(

                          //padding: EdgeInsets.symmetric(vertical: 50),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp()));
                          },
                          child: Center(child: Text("Use current location",style: kLocationScreenButton,)),
                          borderSide: BorderSide(color: PrimaryColor,width: 1.9),
                          shape: StadiumBorder(),
                  ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

