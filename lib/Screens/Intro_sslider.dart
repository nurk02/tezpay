import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tezpay/Screens/welcomeScreen.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tezpay/AppConstant/Constants.dart';
//import 'package:delivious_food_delivery/login.dart';

//void main() => runApp(new FoodMenu());

class FoodMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //SystemChrome.setEnabledSystemUIOverlays([]);
    //SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);

    return MaterialApp(
        debugShowCheckedModeBanner: false, home: MySplashScreen());
  }
}

class MySplashScreen extends StatefulWidget {
  MySplashScreen({Key key}) : super(key: key);

  @override
  MySplashScreenState createState() => new MySplashScreenState();
}

// Custom config
class MySplashScreenState extends State {
  List<Slide> slides = new List();

  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
        backgroundImage: kIntroSliderImage1,
        title: "Sit and wait your food",
        styleTitle: kIntroSliderTextHeading,
        description:
            "just sit and relax, foor will come and ready for you to eat",
        styleDescription: kIntroSliderTextDescription,
        //pathImage: "image/bg.png",
        //backgroundColor: Color(0xffFFFFFF),
      ),
    );
    slides.add(
      new Slide(
        title: "Pay with your card",
        styleTitle: kIntroSliderTextHeading,
        description: "Easy payment with various cards you have",
        styleDescription: kIntroSliderTextDescription,
        //pathImage: "images/photo_museum.png",
        backgroundColor: BackGroundColor,
      ),
    );
    slides.add(
      new Slide(
        title: "Sit and wait your food",
        styleTitle: TextStyle(
            color: BlackColor,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description:
            "just sit and relax, foor will come and ready for you to eat",
        styleDescription: TextStyle(
            color: Color(0xff9E9E9E),
            fontSize: 23.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'Raleway'),
        //pathImage: "images/photo_museum.png",
        backgroundColor: BackGroundColor,
      ),
    );
  }

  void onDonePress() {
// Do what you want
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => WelcomeScreen()),
    );
  }

// Next button
  //renderNextBtn: this.renderNextBtn(),

  Widget renderDoneBtn() {
    return Icon(
      Icons.done,
      color: BackGroundColor,
    );
  }

  //this is skip button put text in text field in
  Widget renderSkipBtn() {
    return Text('');
  }

  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
      listCustomTabs: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'images/bg3.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
//            Container(
//              decoration: BoxDecoration(
//                image: DecorationImage(
//                  image: AssetImage('image/bg.png'),
//                  fit: BoxFit.cover,
//                ),),),
                Container(
                  decoration: BoxDecoration(
                    color: BackGroundColor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(
                          MediaQuery.of(context).size.width / 15.0),
                      topLeft: Radius.circular(
                          MediaQuery.of(context).size.width / 15.0),
                      //Radius.circular(25)
                    ),
                  ),
                  //color: Colors.white,
                  width: double.infinity,
                  //height: 200.0,
                  height: MediaQuery.of(context).size.height / 3,
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 25.0),
                        width: double.infinity,
                        child: Center(
                            child: Text(
                          'Заказывайте продукты',
                          style: kIntroSliderTextHeadingMain,
                        )),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15.0),
                        width: double.infinity,
                        child: Center(
                            child: Text(
                          'Быстро и безопасно',
                          style: kIntroSliderTextDescriptionMain,
                        )),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
        Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(kIntroSliderImage2),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
//            Container(
//              decoration: BoxDecoration(
//                image: DecorationImage(
//                  image: AssetImage("image/bg.png"),
//                  fit: BoxFit.cover,
//                ),),),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(
                          MediaQuery.of(context).size.width / 15.0),
                      topLeft: Radius.circular(
                          MediaQuery.of(context).size.width / 15.0),
                      //Radius.circular(25)
                    ),
                  ),
                  //color: Colors.white,
                  width: double.infinity,
                  //height: 200.0,
                  height: MediaQuery.of(context).size.height / 3,
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 25.0),
                        width: double.infinity,
                        child: Center(
                            child: Text(
                          'Сканируйте и покупайте',
                          style: kIntroSliderTextHeadingMain,
                        )),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15.0),
                        width: double.infinity,
                        child: Center(
                            child: Text(
                          'Теперь не нужно стоят в очереди',
                          style: kIntroSliderTextDescriptionMain,
                        )),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
        Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(kIntroSliderImage3),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
//            Container(
//              decoration: BoxDecoration(
//                image: DecorationImage(
//                  image: AssetImage("image/bg.png"),
//                  fit: BoxFit.cover,
//                ),),),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(
                          MediaQuery.of(context).size.width / 15.0),
                      topLeft: Radius.circular(
                          MediaQuery.of(context).size.width / 15.0),
                      //Radius.circular(25)
                    ),
                  ),
                  //color: Colors.white,
                  width: double.infinity,
                  // height: 200.0,
                  height: MediaQuery.of(context).size.height / 3,
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 25.0),
                        width: double.infinity,
                        child: Center(
                            child: Text(
                          'Бесконтактная оплата',
                          style: kIntroSliderTextHeadingMain,
                        )),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15.0),
                        width: double.infinity,
                        child: Center(
                            child: Text(
                          'Безопасность в первом очереди',
                          style: kIntroSliderTextDescriptionMain,
                        )),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        )
      ],
// List slides
      slides: this.slides,

// Skip button
      renderSkipBtn: this.renderSkipBtn(),
      //colorSkipBtn: Color(0x33000000),
      highlightColorSkipBtn: BlackColor,
// Done button
      renderDoneBtn: this.renderDoneBtn(),
      onDonePress: this.onDonePress,
      colorDoneBtn: PrimaryColor,
      highlightColorDoneBtn: BlackColor,

// Dot indicator
      colorDot: IntroDotColor,
      colorActiveDot: PrimaryColor,
      sizeDot: 12.0,

// Locale
      //locale: 'en',

// Show or hide status bar
      shouldHideStatusBar: true,
    );
  }
}
