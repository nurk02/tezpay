import 'dart:convert';

import 'package:tezpay/AppConstant/Constants.dart';
import 'package:tezpay/database/database_helper.dart';
import 'package:tezpay/models/HomeModel.dart';
import 'package:tezpay/models/MenuModel.dart';
import 'package:tezpay/models/OrderOnline.dart';
import 'package:tezpay/models/Receipt.dart' as Recp;
import 'package:tezpay/models/Products.dart' as Prod;
import 'package:tezpay/models/ReceiptOrderResponse.dart';
import 'package:tezpay/models/User.dart';

import 'package:http/http.dart';

class Rest {
  Future<List<Recp.Receipt>> getOrders(int type) async {
    var db = DatabaseHelper();
    var user = await db.getUser();
    String url = "";
    if (type == 1) {
      url = "${localUrl}core/orderList/online/";
    } else if (type == 2) {
      url = "${localUrl}core/orderList/offline/";
    } else {
      url = "${localUrl}core/orderList/all/";
    }
    try {
      var response = await get(url, headers: {
        "Content-Type": "application/json",
        "Authorization": "Token ${user.authToken}",
      });

      String responseBody = utf8.decode(response.bodyBytes);
      List responseList = jsonDecode(responseBody);

      List<Recp.Receipt> list =
          responseList.map((e) => Recp.Receipt.fromJson(e)).toList();
      switch (response.statusCode) {
        case 200:
          return list;
          break;
        default:
          return [];
      }
    } catch (error) {
      throw (error.toString());
    }
  }

  Future<HomeModel> getHomeInfo(int market) async {
    var db = DatabaseHelper();
    var user = await db.getUser();
    print("Token Token ${user.authToken}");
    try {
      var response = await get('${localUrl}core/home/$market', headers: {
        "Content-Type": "application/json",
        "Authorization": "Token ${user.authToken}",
      });

      String responseBody = utf8.decode(response.bodyBytes);
      print(responseBody);

      HomeModel homeModel = HomeModel.fromJson(jsonDecode(responseBody));
      switch (response.statusCode) {
        case 200:
          return homeModel;
          break;
        default:
          return null;
      }
    } catch (error) {
      print(error);
      throw (error.toString());
    }
  }

  Future<MenuModel> getMenuInfo({int marketId, int categoryId}) async {
    var db = DatabaseHelper();
    var user = await db.getUser();
    print("User ${user.toJson()}");
    print("Token Token ${user.authToken}");

    try {
      var response = await post(
        '${localUrl}core/menu/',
        body: jsonEncode({"marketId": marketId, "categoryId": categoryId}),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Token ${user.authToken}",
        },
      );

      String responseBody = utf8.decode(response.bodyBytes);
      print(responseBody);

      MenuModel menuModel = MenuModel.fromJson(jsonDecode(responseBody));
      switch (response.statusCode) {
        case 200:
          return menuModel;
          break;
        default:
          return null;
      }
    } catch (error) {
      throw (error.toString());
    }
  }

  Future<Prod.Products> getBarCodeInfo(String barcodeId) async {
    var db = DatabaseHelper();
    var user = await db.getUser();
    try {
      var response = await post(
        '${localUrl}core/product/searchProduct/',
        body: jsonEncode({"barcode": barcodeId}),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Token ${user.authToken}",
        },
      );

      String responseBody = utf8.decode(response.bodyBytes);
      print(responseBody);

      Prod.Products model = Prod.Products.fromJson(jsonDecode(responseBody));
      switch (response.statusCode) {
        case 200:
          return model;
          break;
        default:
          throw ("error");
      }
    } catch (error) {
      throw (error.toString());
    }
  }

  Future<ReceiptOrderResponse> getReceipt(int id) async {
    var db = DatabaseHelper();
    var user = await db.getUser();

    try {
      var response = await get(
        '${localUrl}core/receipt/$id',
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Token ${user.authToken}",
        },
      );

      String responseBody = utf8.decode(response.bodyBytes);
      print(responseBody);
      ReceiptOrderResponse model =
          ReceiptOrderResponse.fromJson(jsonDecode(responseBody));
      switch (response.statusCode) {
        case 200:
          return model;
          break;
        default:
          throw ("error");
      }
    } catch (error) {
      throw (error.toString());
    }
  }

  Future<User> postAuth(String username, String password) async {
    try {
      var response = await post(
        '${localUrl}users/login/',
        body: jsonEncode({"username": username, "password": password}),
        headers: {
          "Content-Type": "application/json",
        },
      );

      String responseBody = utf8.decode(response.bodyBytes);
      User user = User.fromJson(jsonDecode(responseBody));

      print(user.toJson());

      switch (response.statusCode) {
        case 200:
          return user;
          break;
        default:
          return null;
      }
    } catch (error) {
      throw (error.toString());
    }
  }

  Future<User> postSignUp(String username, String password) async {
    var db = DatabaseHelper();
    try {
      var response = await post(
        '${localUrl}users/signup/',
        body: jsonEncode({"username": username, "password": password}),
        headers: {
          "Content-Type": "application/json",
        },
      );

      String responseBody = utf8.decode(response.bodyBytes);
      print(responseBody);
      User user = new User.fromSignUp(jsonDecode(responseBody));
      print("SAVED" + user.toJson().toString());

      db.saveUserSignUp(user.toJson());
      print("BUGBUG");

      switch (response.statusCode) {
        case 200:
          return user;
          break;
        default:
          return null;
      }
    } catch (error) {
      throw (error.toString());
    }
  }

  Future<Map> postOrderOnline(String address) async {
    var db = DatabaseHelper();
    var user = await db.getUser();

    var products = await db.getOrderOnline();

    var order = OrderRequest(address: address, productIds: products);
    try {
      var response = await post(
        '${localUrl}core/orderOnline/',
        body: jsonEncode(order.toJson()),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Token ${user.authToken}",
        },
      );

      String responseBody = utf8.decode(response.bodyBytes);
      Map orderMap = jsonDecode(responseBody);

      switch (response.statusCode) {
        case 200:
          return orderMap;
          break;
        default:
          return null;
      }
    } catch (error) {
      throw (error.toString());
    }
  }

  Future<Map> postOrderOffline() async {
    var db = DatabaseHelper();
    var user = await db.getUser();

    var products = await db.getOrderOnline();

    var order = OrderRequest(productIds: products);
    try {
      var response = await post(
        '${localUrl}core/orderOffline/',
        body: jsonEncode(order.toOfflineJson()),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Token ${user.authToken}",
        },
      );

      String responseBody = utf8.decode(response.bodyBytes);
      print(responseBody);
      Map orderMap = jsonDecode(responseBody);

      switch (response.statusCode) {
        case 200:
          return orderMap;
          break;
        default:
          return null;
      }
    } catch (error) {
      throw (error.toString());
    }
  }
}
