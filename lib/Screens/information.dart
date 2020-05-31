import 'package:flutter/material.dart';
import 'package:tezpay/Screens/profile.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tezpay/AppConstant/Constants.dart';
import 'package:tezpay/Widgets/CircularBackButton.dart';

class Information extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return informations();
  }
}
class informations extends StatefulWidget {
  @override
  _informationsState createState() => _informationsState();
}

class _informationsState extends State<informations> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF1F5F8),
      //backgroundColor: Color(0xffF1F5F8),
      body: SafeArea(
          child: Container(
            child: Column(
              children: <Widget>[
                Flexible(
                  child: Container(
                    margin: EdgeInsets.only(top: 10.0,left: 10.0,right: 5.0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Circular_Back_Button(back: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile()));
                              },),

                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(top: 20.0),
                                //width: MediaQuery.of(context).size.width,
                                child: Text('Information',
                                 // textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25.0,
                                    fontFamily: 'popins',
                                  ),
                                ),),
                              Container(
                                  child: GestureDetector(
                                    child: Icon(Icons.edit,color: PrimaryColor,),
                                    onTap: (){},
                                  ),
                                //color: Colors.red,
                              ),
                            ],
                          ),
                        ),

                        Container(
                          margin: EdgeInsets.only(top: 10.0),
                          padding: EdgeInsets.only(left: 10.0,right: 10.0),
                          color: Colors.white,
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height/12,
                          child:  Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child: Text('Username',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.grey,
                                    fontFamily: 'popins',
                                  ),
                                ),),
                              Container(
                                child: Text('Johndoe123',
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'popins',
                                  ),
                                ),),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 2.0),
                          padding: EdgeInsets.only(left: 10.0,right: 10.0),
                          color: Colors.white,
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height/12,
                          child:  Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child: Text('Email',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.grey,
                                    fontFamily: 'popins',
                                  ),
                                ),),
                              Container(
                                child: Text('Johndoe@gmail.com',
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'popins',
                                  ),
                                ),),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 2.0),
                          padding: EdgeInsets.only(left: 10.0,right: 10.0),
                          color: Colors.white,
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height/12,
                          child:  Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child: Text('Phone',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.grey,
                                    fontFamily: 'popins',
                                  ),
                                ),),
                              Container(
                                child: Text('123 456 789',
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'popins',
                                  ),
                                ),),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 2.0),
                          padding: EdgeInsets.only(left: 10.0,right: 10.0),
                          color: Colors.white,
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height/12,
                          child:  Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child: Text('Gender',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.grey,
                                    fontFamily: 'popins',
                                  ),
                                ),),
                              Container(
                                child: Text('Male',
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'popins',
                                  ),
                                ),),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 2.0),
                          padding: EdgeInsets.only(left: 10.0,right: 10.0),
                          color: Colors.white,
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height/12,
                          child:  Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child: Text('Date of Birth',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.grey,
                                    fontFamily: 'popins',
                                  ),
                                ),),
                              Container(
                                child: Text('16/04/1996',
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'popins',
                                  ),
                                ),),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                ),

              ],
            ),
          )
      ),
    );
  }
}
