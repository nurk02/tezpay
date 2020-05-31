

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tezpay/Screens/AdresssScreen.dart';
import 'package:tezpay/Screens/orderstatus.dart';

/////////////////////COLORS

const BackGroundColor = Colors.white;
const PrimaryColor = Color(0XFFFBAF03);
const PromotionalTextColor = Color(0xFFFA7268);
const unDeliveredColor = Colors.grey;
const CategoryColor1 = Color(0xFF3A54F1);
const CategoryColor2 = Color(0xFFFA7268);
const Delete = Color(0xFFC20000);
const BlackColor = Colors.black;
const IntroDotColor = Color(0xff9E9E9E);





///////////////////Gradient Color

//---Drawer
const kDrawerGradient = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color.fromRGBO(251, 175, 3, 0.5), Color.fromRGBO(251, 175, 3, 1.0)],
  tileMode: TileMode.repeated,
);

//main menu
const kMainMenuCategoryGradient1 = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [Color.fromRGBO(251, 175, 3, 0.6), Color.fromRGBO(251, 175, 3, 1.0)],
  tileMode: TileMode.repeated,
);
const kMainMenuCategoryGradient2 = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [Color.fromRGBO(54, 84, 241, 0.6), Color.fromRGBO(54, 84, 241, 1.0)],
  tileMode: TileMode.repeated,
);
const kMainMenuCategoryGradient3 = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [Color.fromRGBO(250, 114, 104, 0.6), Color.fromRGBO(250, 114, 104, 1.0)],
  tileMode: TileMode.repeated,
);


//menu

const kMenuListUnSelected = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [Color.fromRGBO(255, 255, 255, 1), Color.fromRGBO(255, 2555, 255, 1.0)],
  tileMode: TileMode.repeated,
);
const kMenuListSelected = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [Color.fromRGBO(251, 175, 3, 0.6), Color.fromRGBO(251, 175, 3, 1.0)],
  tileMode: TileMode.repeated,
);
const kMenuListGradient2 = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [Color.fromRGBO(247, 248, 250, 1.0), Color.fromRGBO(239, 239, 239, 1.0)],
  tileMode: TileMode.repeated,
);
const kMenuListGradient3 = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [Color.fromRGBO(250, 114, 104, 0.6), Color.fromRGBO(250, 114, 104, 1.0)],
  tileMode: TileMode.repeated,
);



//----APP Currency
const kAppCurrency = ' \KZT';


///////////////// TextStyle Contsant


//Splash Screen

const kSplashScreen = TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold, letterSpacing: 2.0, fontFamily: 'popins',color: Colors.black);
const kSplashScreenOO = TextStyle(letterSpacing: 2.0, color: Colors.white, fontSize: 50.0, fontWeight: FontWeight.bold,);

//Intro Slider
const kIntroSliderTextHeading = TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold, fontFamily: 'popins');
const kIntroSliderTextDescription = TextStyle(color: Color(0xff9E9E9E), fontSize: 23.0, fontStyle: FontStyle.italic, fontFamily: 'popins');
const kIntroSliderTextHeadingMain = TextStyle(fontFamily: 'popins', fontSize: 32.0, fontWeight: FontWeight.bold,);
const kIntroSliderTextDescriptionMain = TextStyle(fontFamily: 'popins', fontSize: 22.0, fontWeight: FontWeight.bold,);
const kIntroSliderTextDescriptionMain2 = TextStyle(fontFamily: 'popins', fontSize: 15.0, color: Colors.grey,);



//--Welcome Screen
const FbButtonValue = 900;
const kWelcomeText = TextStyle(fontSize: 18.0,fontFamily: 'popins',fontWeight: FontWeight.bold,color: Colors.black87,letterSpacing: .3);
const kWelcomeScreenPhone = TextStyle(fontSize: 15.0,fontFamily: 'popins',fontWeight: FontWeight.bold,color: Colors.green,letterSpacing: .3);
const kWelcomeScreenFb = TextStyle(fontSize: 15.0,fontFamily: 'popins',fontWeight: FontWeight.bold,color: Colors.blue ,letterSpacing: .3);
const kWelcomeScreenGMail = TextStyle(fontSize: 15.0,fontFamily: 'popins',fontWeight: FontWeight.bold,color: Colors.red,letterSpacing: .3);

//--Login Screen
const kLoginText = TextStyle(fontSize: 18.0,fontFamily: 'popins',fontWeight: FontWeight.bold,color: Colors.black87,letterSpacing: .3);
const kLoginDetailText = TextStyle(fontSize: 15.0,fontFamily: 'popins',fontWeight: FontWeight.normal,color: Colors.black87,letterSpacing: .3);
const kLoginPhoneHint = TextStyle(fontSize: 18.0,fontFamily: 'popins',fontWeight: FontWeight.bold,color: Colors.black45,letterSpacing: .3);
const kLoginPhoneLabel = TextStyle(fontSize: 18.0,fontFamily: 'popins',fontWeight: FontWeight.bold,color: Colors.black87,letterSpacing: .3);
const kLoginSendText = TextStyle(fontSize: 17.0,fontFamily: 'popins',fontWeight: FontWeight.bold,color: PrimaryColor,letterSpacing: .3);

//--OtpScreen
const kOtpHeading = TextStyle(fontSize: 20.0,fontFamily: 'popins',fontWeight: FontWeight.bold,color: Colors.black87,letterSpacing: .3);


//--location

const kLocationScreenHeading = TextStyle(fontSize: 25.0,fontFamily: 'popins',fontWeight: FontWeight.bold,);
const kLocationScreenDescription = TextStyle(fontSize: 15.0,fontFamily: 'popins',fontWeight: FontWeight.normal,color: Colors.black45);
const kLocationScreenButton = TextStyle(fontSize: 18.0,fontFamily: 'popins',fontWeight: FontWeight.normal,color: PrimaryColor);
//--Drawer
const kDrawerElement = TextStyle(fontSize: 18.0,fontFamily: 'popins',fontWeight: FontWeight.normal,color: Colors.white,letterSpacing: .3);

//--MainMenu

const kMainMenuHeadingTitle = TextStyle(fontSize: 18.0,fontFamily: 'popins',fontWeight: FontWeight.bold,color: Colors.black54,letterSpacing: .2);
const kMainMenuHeadingTitle2 = TextStyle(fontSize: 27.0,fontFamily: 'popins',fontWeight: FontWeight.bold,color: Colors.black87,letterSpacing: 2.0);
const kMainMenuHeadings = TextStyle(fontSize: 20.0,fontFamily: 'popins',fontWeight: FontWeight.bold,color: Colors.black,letterSpacing: .5);
const kMainMenuCategoryNames = TextStyle(fontSize: 14.0,fontFamily: 'popins',fontWeight: FontWeight.normal,color: Colors.white,letterSpacing: .3);
const kMainMenuProductName = TextStyle(fontSize: 17.0,fontFamily: 'popins',fontWeight: FontWeight.bold,color: Colors.black,letterSpacing: .3);
const kMainMenuProductPrice = TextStyle(fontSize: 15.0,fontFamily: 'popins',fontWeight: FontWeight.bold,color: PrimaryColor,letterSpacing: .3);
const kMainMenuProductCutPrice = TextStyle(fontSize: 13.0,fontFamily: 'popins',fontWeight: FontWeight.bold,color: PrimaryColor,letterSpacing: .3,decoration: TextDecoration.lineThrough,decorationColor:PromotionalTextColor,decorationThickness: 4 );
const kMainMenuServe = TextStyle(fontSize: 12.0,fontFamily: 'popins',fontWeight: FontWeight.normal,color: Colors.black26,letterSpacing: .3);
const kMainMenuAddToCart = TextStyle(fontSize: 14.0,fontFamily: 'popins',fontWeight: FontWeight.normal,color: Colors.white,letterSpacing: .3);
const kMainMenuPromotionPercent = TextStyle(fontSize: 14.0,fontFamily: 'popins',fontWeight: FontWeight.normal,color: Colors.white,letterSpacing: .3);
const kMainMenuAmountInCart = TextStyle(fontSize: 14.0,fontFamily: 'popins',fontWeight: FontWeight.bold,color: Colors.grey,letterSpacing: .3);
const kMainMenuSeeAll = TextStyle(fontSize: 14.0,fontFamily: 'popins',fontWeight: FontWeight.bold,color: PrimaryColor,letterSpacing: .3);

//--Menu

const kMenutezpay = TextStyle(fontSize: 14.0,fontFamily: 'popins',fontWeight: FontWeight.bold,color: Colors.black38,letterSpacing: .3);
const kMenuHeading = TextStyle(fontSize: 25.0,fontFamily: 'popins',fontWeight: FontWeight.bold,color: Colors.black,letterSpacing: 2.0);
const kMenuListText = TextStyle(fontSize: 12.0,fontFamily: 'popins',fontWeight: FontWeight.bold,color: Colors.black,letterSpacing: .3);
const kMenuListSelectedText = TextStyle(fontSize: 12.0,fontFamily: 'popins',fontWeight: FontWeight.bold,color: Colors.white,letterSpacing: .3);
const kMenuProductsName = TextStyle(fontSize: 18.0,fontFamily: 'popins',fontWeight: FontWeight.bold,color: Colors.black,letterSpacing: .3);
const kMenuProductsPrice = TextStyle(fontSize: 20.0,fontFamily: 'popins',fontWeight: FontWeight.bold,color: Colors.black45,letterSpacing: .3);

// ---- Order status Screen
const kOrderStatusTime = TextStyle(fontSize: 14.0,fontFamily: 'popins',fontWeight: FontWeight.bold,color: Colors.black38,letterSpacing: .3);
const kOrderStatusText = TextStyle(fontSize: 17.0,fontFamily: 'popins',fontWeight: FontWeight.bold,color: Colors.black87,letterSpacing: .3);

// ---- Profile Screen
const kProfileName = TextStyle(fontSize: 19.0,fontFamily: 'popins',fontWeight: FontWeight.bold,color: Colors.black87,letterSpacing: .7);
const kProfilePhone = TextStyle(fontSize: 17.0,fontFamily: 'popins',fontWeight: FontWeight.normal,color: Colors.black87,letterSpacing: .3);

//--- My Orders

const kMyOrdersNumber = TextStyle(fontSize: 18.0,fontFamily: 'popins',fontWeight: FontWeight.bold,color: Colors.black87,letterSpacing: .7);
const kMyOrdersDate = TextStyle(fontSize: 17.0,fontFamily: 'popins',fontWeight: FontWeight.normal,color: Colors.black45,letterSpacing: .3);
const kMyOrdersTime = TextStyle(fontSize: 17.0,fontFamily: 'popins',fontWeight: FontWeight.normal,color: Colors.black54,letterSpacing: .3);
const kMyOrdersDetails = TextStyle(fontSize: 15.0,fontFamily: 'popins',fontWeight: FontWeight.bold,color: Colors.black87,letterSpacing: .3);
const kMyOrdersTabBarUnSelected = TextStyle(fontSize: 16.0,fontFamily: 'popins',fontWeight: FontWeight.bold,color: Colors.black87,letterSpacing: .3);
const kMyOrdersTabBarSelected = TextStyle(fontSize: 16.0,fontFamily: 'popins',fontWeight: FontWeight.bold,color:PrimaryColor,letterSpacing: .3);

//--My Cart
const kMyCartText = TextStyle(fontSize: 25.0,fontFamily: 'popins',fontWeight: FontWeight.normal,color: Colors.grey,letterSpacing: .3);
const kMyCartItemHeading = TextStyle(fontSize: 18.0,fontFamily: 'popins',fontWeight: FontWeight.bold,color: Colors.black87,letterSpacing: .3);
const kMyCartItemPrice = TextStyle(fontSize: 16.0,fontFamily: 'popins',fontWeight: FontWeight.bold,color: Colors.black87,letterSpacing: .3);
const kMyCartItemTotal = TextStyle(fontSize: 14.0,fontFamily: 'popins',fontWeight: FontWeight.bold,color: Colors.grey,letterSpacing: .3);
const kMyCartItemTotalPrice = TextStyle(fontSize: 20.0,fontFamily: 'popins',fontWeight: FontWeight.bold,color: Colors.black87,letterSpacing: .3);
const kMyCartPlaceOrder = TextStyle(fontSize: 18.0,fontFamily: 'popins',fontWeight: FontWeight.bold,color: Colors.white,letterSpacing: .3);




//--- AddressScreen
const kAddressStreet = TextStyle(fontSize: 18.0,fontFamily: 'popins',fontWeight: FontWeight.bold,color: Colors.black87,letterSpacing: .3);
const kAddressPost = TextStyle(fontSize: 17.0,fontFamily: 'popins',fontWeight: FontWeight.normal,color: Colors.black87,letterSpacing: .3);

//--- ProductDetail Screen
const kProductDetailHeading = TextStyle(fontSize: 25.0,fontFamily: 'popins',fontWeight: FontWeight.bold,color: Colors.black87,letterSpacing: .3,decoration: TextDecoration.none,);
const kProductDetailText = TextStyle(fontSize: 16.0,fontFamily: 'popins',fontWeight: FontWeight.bold,color: Colors.black87,letterSpacing: .3,decoration: TextDecoration.none,);
const kProductDetailQuantity = TextStyle(fontSize: 20.0,fontFamily: 'popins',fontWeight: FontWeight.bold,color: Colors.black87,letterSpacing: .3,decoration: TextDecoration.none,);
const kProductDetailPrice = TextStyle(fontSize: 27.0,fontFamily: 'popins',fontWeight: FontWeight.bold,color: Colors.black87,letterSpacing: .3,decoration: TextDecoration.none,);



///////////////--------- Asset Images --------////////////////


//---Splash
const kSplashScreenBackgroundImage = 'images/splashplate.png';
const kSplashScreenLogo= 'images/logo.png';

//---IntroSlider
const kIntroSliderImage1 = 'image/bg.png';
const kIntroSliderImage2 = 'images/bg1.jpg';
const kIntroSliderImage3 = 'images/bg2.jpg';
//---WelcomeScreen
const kWelcomeScreenBackgroundImage = 'images/food/start5.jpg';
const kWelcomeScreenSvg1 = 'images/svg/account.svg';
const kWelcomeScreenSvg2 = 'images/svg/phoneicons.svg';
const kWelcomeScreenSvg3 = 'images/svg/facebookicon.svg';
const kWelcomeScreenSvg4 = 'images/svg/googleicon.svg';
//---LoginScreen
const kLoginScreenBackgroundImage = 'images/food/start2.jpg';
//---OtpScreen
const kOtpScreenBackgroundImage = 'images/food/start1.jpg';
//---Location
const kLocationScreenSvg= 'images/svg/locationicon.svg';
//--HomeScreen
const kHomeScreenSvg = 'images/svg/home.svg';
const kHomeScreenSvg2 = 'images/svg/menu.svg';
const kHomeScreenSvgScan = 'images/svg/barcode.svg';
const kHomeScreenSvg3 = 'images/svg/order.svg';
const kHomeScreenSvg4 = 'images/svg/support.svg';
const kHomeScreenSvg5 = 'images/svg/gears.svg';
const kHomeScreenProfileImage = 'https://www.nicepng.com/png/detail/186-1866063_dicks-out-for-harambe-sample-avatar.png';

///////////////--------- Backend URL --------////////////////
// const localUrl = "http://127.0.0.1:8000/api/v1/";
// const localUrl = "http://10.0.2.2:8000/api/v1/";

const localUrl = "https://tezpay.herokuapp.com/api/v1/";
