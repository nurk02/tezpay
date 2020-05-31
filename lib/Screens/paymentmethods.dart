import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tezpay/AppConstant/Constants.dart';
import 'package:tezpay/Screens/profile.dart';
import 'package:tezpay/Widgets/CircularBackButton.dart';

class PaymentMethod extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return paymentmethods();
  }
}

class paymentmethods extends StatefulWidget {

  @override
  _paymentmethodsState createState() => _paymentmethodsState();
}

class _paymentmethodsState extends State<paymentmethods> {


  bool _isCard;
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
                    margin: EdgeInsets.only(top: 0.0,left: 10.0,right: 5.0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Circular_Back_Button(back: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()));
                              }
                              ),

                            ],
                          ),
                        ),
                        //headertext
                        Container(
                          margin: EdgeInsets.only(top: 10.0),
                          width: MediaQuery.of(context).size.width,
                          child: Text('Способы оплаты',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25.0,
                              fontFamily: 'popins',
                            ),
                          ),),
                        Container(
                          margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/18),
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                //margin: EdgeInsets.only(right: 10.0),
                                height:  MediaQuery.of(context).size.height/8,
                                width:  MediaQuery.of(context).size.width/2.5,
                                //color: Colors.blueGrey,
                                decoration: BoxDecoration(
                                  color: Color(0xff09003F),
                                  borderRadius: BorderRadius.circular(15.0),),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Container(child: SvgPicture.asset('images/svg/credit-card.svg',width: 30.0,color: Colors.white,)),
                                    Container(child: Text('Карта',
                                      style: TextStyle(
                                        fontFamily: 'popins',
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0,
                                      ),
                                    )),
                                  ],
                                ),
                              ),
                              Container(
                                //margin: EdgeInsets.only(right: 10.0),
                                height:  MediaQuery.of(context).size.height/8,
                                width:  MediaQuery.of(context).size.width/2.5,
                                //color: Colors.blueGrey,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xff09003F),),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15.0),),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Container(child: SvgPicture.asset('images/svg/payment-method.svg',width: 30.0,color: Color(0xff09003F),)),
                                    Container(child: Text('Наличными',
                                      style: TextStyle(
                                        fontFamily: 'popins',
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff09003F),
                                      ),
                                    )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
//                         GestureDetector(
//                           child: Container(
//                             width: MediaQuery.of(context).size.width,
//                             margin: EdgeInsets.only(top: 20.0),
//                             child: Text('Add New card',
//                               textAlign: TextAlign.end,
//                               style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 color: PrimaryColor,
//                                 fontFamily: 'popins',
//                                 fontSize: 18.0,
//                               ),
//                             ),
//                           ),
//                           onTap: (){

//                           },
//                         ),
//                         Container(
//                           margin: EdgeInsets.only(top: 20.0),
//                           height: MediaQuery.of(context).size.height/10,
//                           width: MediaQuery.of(context).size.width,
//                           //color: Colors.red,
//                           child: Card(
//                             elevation: 3.0,
//                             child: Row(
//                               children: <Widget>[
//                                 Container(
//                                   margin: EdgeInsets.only(left: 10.0),
//                                   child:  SvgPicture.asset('images/svg/visa.svg',width: MediaQuery.of(context).size.width/8,),
// //                                  Text('VISA',
// //                                    style: TextStyle(
// //                                      fontWeight: FontWeight.bold,
// //                                      color: Colors.blue[900],
// //                                      fontFamily: 'popins',
// //                                      fontSize: 25.0,
// //                                    ),
// //                                    ),
//                                 ),
//                                 Container(
//                                   margin: EdgeInsets.only(left: 10.0),
//                                   child: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                     children: <Widget>[
//                                       Container(
//                                           child:  Text('423 *********123',
//                                             style: TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                               fontFamily: 'popins',
//                                               fontSize: 20.0,
//                                             ),
//                                           )
//                                       ),
//                                       Container(
//                                         // margin: EdgeInsets.only(top: 5),
//                                         child: Text(
//                                           'Expires 07/23',
//                                           style: TextStyle(
// //                                                    fontWeight: FontWeight.bold,
//                                             fontFamily: 'popins',
//                                             fontSize: 18.0,
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
                  
                  
                  
                      ],
                    ),
                  ),
                ),

                Container(
                  height: 15.0,
                ),
              ],
            ),
          )
      ),
    );
  }
}

