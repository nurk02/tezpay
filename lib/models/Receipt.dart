import 'package:intl/intl.dart';

class Receipt {
  int id;
  // Market market;
  String payed;
  String receiptId;
  double price;
  int shopType;
  String createdDate;
  int user;

  Receipt(
      {this.id,
      this.payed,
      this.receiptId,
      this.price,
      this.shopType,
      this.user});

  Receipt.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    // market =
    //     json['market'] != null ? new Market.fromJson(json['market']) : null;
    payed = json['payed'];
    receiptId = json['receipt_id'];
    createdDate = json['created_date'];
    price = json['price'];
    shopType = json['shop_type'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    // if (this.market != null) {
    //   data['market'] = this.market.toJson();
    // }
    data['payed'] = this.payed;
    data['receipt_id'] = this.receiptId;
    data['price'] = this.price;
    data['shop_type'] = this.shopType;
    data['user'] = this.user;
    return data;
  }

  String get time{
    final df = new DateFormat('dd.MM.yyyy hh:mm a');
    return df.format(DateTime.parse(this.createdDate).toLocal());
  }
}

class Market {
  int id;
  String title;
  String address;
  String deliveryPrice;
  List<int> category;

  Market(
      {this.id, this.title, this.address, this.deliveryPrice, this.category});

  Market.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    address = json['address'] == null ? "" : json["address"];
    deliveryPrice = json['delivery_price'] == null ? "" : json["delivery_price"];
    category = json['category'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['address'] = this.address;
    data['delivery_price'] = this.deliveryPrice;
    data['category'] = this.category;
    return data;
  }
}

