import 'dart:io';

import 'package:tezpay/models/Address.dart';
import 'package:tezpay/models/Products.dart';
import 'package:tezpay/models/User.dart';
import 'package:path/path.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;

  static Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  DatabaseHelper.internal();

  initDb() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "main.db");
    var ourDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return ourDb;
  }

  void _onCreate(Database db, int version) async {
    await db.execute("""
      create table user
(
    username                  varchar(255),
    auth_token                varchar(255),
    type                      varchar(255)
)
       """);
    print("User created");

    await db.execute("""
      create table order_offline
(
      order_id       INTEGER primary key AUTOINCREMENT NOT NULL,
      product_id  int,
      count int, 
      name  varchar(255),
      image varchar(255),
      description  varchar(255),
      price varchar(255)
)
       """);

    await db.execute("""
      create table order_online
(
      order_id       INTEGER primary key AUTOINCREMENT NOT NULL,
      product_id  int,
      count int, 
      name  varchar(255),
      image varchar(255),
      description  varchar(255),
      price varchar(255)
)
       """);

    print("Order online created");

    await db.execute("""
      create table address
(
      address_id       INTEGER primary key AUTOINCREMENT NOT NULL,
      street varchar(255),
      house  varchar(255),
      podezd  varchar(255),
      kvartira  varchar(255)
)
       """);

    print("Address created");
  }

  Future<void> dropAll() async {
    var dbClient = await db;
    dbClient.delete("address");
    dbClient.delete("user");
    dbClient.delete("order_online");
    dbClient.delete("order_offline");
  }

  //insertion address
  Future<int> insertAddress(Address address) async {
    var dbClient = await db;
    int res = await dbClient.insert("address", address.toJson());
    return res;
  }

  //get order
  Future<List<Address>> getAddresses() async {
    var dbClient = await db;
    List<Map<String, dynamic>> res = await dbClient.query("address");
    List<Address> list = res.map((e) => Address.fromDBJson(e)).toList();
    return list;
  }

  //insertion
  Future<int> insertOrderOffline(Products products) async {
    var dbClient = await db;
    int res = await dbClient.insert("order_offline", products.toDBJson());
    return res;
  }

  //get order
  Future<List<Products>> getOrderOffline() async {
    var dbClient = await db;
    List<Map<String, dynamic>> res = await dbClient.query("order_offline");
    List<Products> list = res.map((e) => Products.fromDB(e)).toList();
    return list;
  }

  //delete order
  Future<int> deleteProductOrderOffline(int id) async {
    var dbClient = await db;
    int s = await dbClient
        .delete("order_offline", where: 'order_id = ?', whereArgs: [id]);
    return s;
  }

  //delete order
  Future<int> decreaseProduct(int id) async {
    var dbClient = await db;
    List<Map<String, dynamic>> res = await dbClient
        .query("order_offline", where: 'order_id = ?', whereArgs: [id]);
    Products products = Products.fromDB(res[0]);
    print(res);
    if (products.count > 1) {
      int cc = products.count - 1;
      print("SSDFSDF");
      await dbClient.update("order_offline", {'count': cc},
          where: 'order_id = ?', whereArgs: [id]);
    }

    return 1;
  }

  Future<int> increaseProduct(int id) async {
    var dbClient = await db;
    List<Map<String, dynamic>> res = await dbClient
        .query("order_offline", where: 'order_id = ?', whereArgs: [id]);
    Products products = Products.fromDB(res[0]);
    print(res);

    int cc = products.count + 1;
    print("SSDFSDF");
    await dbClient.update("order_offline", {'count': cc},
        where: 'order_id = ?', whereArgs: [id]);

    return 1;
  }

  //insertion
  Future<int> insertOrderOnline(Products products) async {
    var dbClient = await db;
    int res = await dbClient.insert("order_online", products.toDBJson());
    return res;
  }

  //get order
  Future<List<Products>> getOrderOnline() async {
    var dbClient = await db;
    List<Map<String, dynamic>> res = await dbClient.query("order_online");
    print(res);
    List<Products> list = res.map((e) => Products.fromDB(e)).toList();
    return list;
  }

  //delete order
  Future<int> deleteProductOrderOnline(int id) async {
    var dbClient = await db;
    int s = await dbClient
        .delete("order_online", where: 'order_id = ?', whereArgs: [id]);
    return s;
  }

  //insertion
  Future<int> saveUserSignUp(Map<String, dynamic> json) async {
    var dbClient = await db;
    int res = await dbClient.insert("User", json);
    return res;
  }

  //insertion
  Future<int> saveUser(User user) async {
    var dbClient = await db;
    int res = await dbClient.insert("User", user.toJson());
    return res;
  }

  //check user in db
  Future<bool> checkUser() async {
    var dbClient = await db;
    var res = await dbClient.query("User");
    if (res.isNotEmpty) {
      return true;
    } else
      return false;
  }

  //get user in db dont call it in splash and login
  Future<User> getUser() async {
    var dbClient = await db;
    List<Map<String, dynamic>> res = await dbClient.query("User");
    print("USSSSSEERRR");
    print(res);
    User user = User.fromNormal(res[0]);
    return user;
  }

  

  Future<User> getUserProfile() async {
    var dbClient = await db;
    List<Map<String, dynamic>> res = await dbClient.query("User");
    User user = User.fromSignUp(res[0]);
    return user;
  }

  //DROP ALL TABLES
  Future<void> deleteUser() async {
    var dbClient = await db;
    await dbClient.delete("User");
  }
}
