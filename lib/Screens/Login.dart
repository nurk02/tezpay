import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tezpay/AppConstant/Constants.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor:BackGroundColor,
      body: SingleChildScrollView(

        child: Stack(
          children: <Widget>[
            Container(
              color: PrimaryColor,
              height: MediaQuery.of(context).size.height/1.4,
            ),
            Container(
              color: PrimaryColor,
              height: MediaQuery.of(context).size.height/1.4,
              width: double.infinity,
              child: Hero(
                tag: "image",
                child: Image.asset(kLoginScreenBackgroundImage,fit: BoxFit.cover,),),
            ),
            Column(
             children: <Widget>[
               Container(
                 height: MediaQuery.of(context).size.height/3,
                 width: MediaQuery.of(context).size.width,
                 margin: EdgeInsets.only(left: 25.0,right: 25.0,top:MediaQuery.of(context).size.height/20),
                 //height: MediaQuery.of(context).size.height/,
                 //width: double.infinity,

//               child: Hero(
//                   tag: "image",
//                   child: Image.asset('images/splashplate.png',)),
                 //color: Colors.red,
               ),
               Container(
                  height: MediaQuery.of(context).size.height/2.2,
                 padding: EdgeInsets.all(10.0),

                 //transform: Matrix4.translationValues(0.0, 100.0, 0.0),
                 margin: EdgeInsets.only(left: 15.0,right: 15.0,bottom: MediaQuery.of(context).size.height/40,top:MediaQuery.of(context).size.height/15),
                 width: double.infinity,
                 child: Card(
                   elevation: 6.0,
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(20)
                   ),
                   child: Container(
                     child: Column(
                       children: <Widget>[
                         Container(
                           margin: EdgeInsets.only(top: 15.0),
                           child: SvgPicture.asset(kWelcomeScreenSvg1,width: 40.0,color: PrimaryColor,),
                         ),
                         Container(
                           margin: EdgeInsets.only(top: 20.0),
                           child: Text('LOGIN',
                             style: kLoginText
                             ,),
                         ),
                         Container(
                           width: double.infinity,
                           margin: EdgeInsets.only(top: 8.0),
                           child: Text('Enter your validmobile number to continue',
                             textAlign: TextAlign.center,
                             style: kLoginDetailText
                             ,),
                         ),
                         Container(
                           height: MediaQuery.of(context).size.height/16,
                           margin: EdgeInsets.only(left: 20.0,right: 20.0,top: MediaQuery.of(context).size.height/40),
                           child: TextField(
                             textAlign: TextAlign.center,
                             keyboardType: TextInputType.number,
                             style: kLoginPhoneLabel,
                             decoration: InputDecoration(
                               fillColor: Colors.grey[300],
                               filled: true,
                               hintText: '123 456 789 0',
                               hintStyle:kLoginPhoneHint,

                               contentPadding: EdgeInsets.all(10),
                               border: OutlineInputBorder(
                                 borderRadius: BorderRadius.all(
                                   Radius.circular(100.0),
                                 ),
                                 borderSide: BorderSide(
                                   width: 0,
                                   style: BorderStyle.none,)
                               ),
                             ),
                           ),
                         ),
                         Container(
                           //width: MediaQuery.of(context).size.width,
                           margin: EdgeInsets.only(left: 20.0,right: 20.0,top: MediaQuery.of(context).size.height/35,bottom: 0.0),

                           height: MediaQuery.of(context).size.height/17,
                           child: RaisedButton(
                             elevation: 6.0,
                             color: Colors.white,
                             highlightColor: PrimaryColor.withOpacity(0.4),
                             shape: RoundedRectangleBorder(
                               borderRadius: new BorderRadius.circular(100.0),
                               side: BorderSide(color: PrimaryColor,width: 2.0),
                             ),
                             onPressed:  (){
                            
                             },
                             child:Container(child:Center(
                               child: Text('SEND',
                                 style:kLoginSendText ),
                             ),),
                           ),
                         ),
                       ],
                     ),
                   ),
                 ),
               ),
             ],
              ),
          ],
        ),
      ),
    );
  }
}
