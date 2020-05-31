class ReceiptOrderResponse {
  Receipt receipt;
  List<Orders> orders;

  ReceiptOrderResponse({this.receipt, this.orders});

  ReceiptOrderResponse.fromJson(Map<String, dynamic> json) {
    receipt =
        json['receipt'] != null ? new Receipt.fromJson(json['receipt']) : null;
    if (json['orders'] != null) {
      orders = new List<Orders>();
      json['orders'].forEach((v) {
        orders.add(new Orders.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.receipt != null) {
      data['receipt'] = this.receipt.toJson();
    }
    if (this.orders != null) {
      data['orders'] = this.orders.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Receipt {
  int id;
  Market market;
  String payed;
  String address;
  String paymentUrl;
  String receiptId;
  double price;
  String createdDate;
  int shopType;
  int user;

  Receipt(
      {this.id,
      this.market,
      this.payed,
      this.address,
      this.paymentUrl,
      this.receiptId,
      this.price,
      this.createdDate,
      this.shopType,
      this.user});

  Receipt.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    market =
        json['market'] != null ? new Market.fromJson(json['market']) : null;
    payed = json['payed'];
    address = json['address'];
    paymentUrl = json['payment_url'];
    receiptId = json['receipt_id'];
    price = json['price'];
    createdDate = json['created_date'];
    shopType = json['shop_type'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.market != null) {
      data['market'] = this.market.toJson();
    }
    data['payed'] = this.payed;
    data['address'] = this.address;
    data['payment_url'] = this.paymentUrl;
    data['receipt_id'] = this.receiptId;
    data['price'] = this.price;
    data['created_date'] = this.createdDate;
    data['shop_type'] = this.shopType;
    data['user'] = this.user;
    return data;
  }
}

class Market {
  int id;
  List<Category> category;
  String title;
  String address;
  int deliveryPrice;

  Market(
      {this.id, this.category, this.title, this.address, this.deliveryPrice});

  Market.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['category'] != null) {
      category = new List<Category>();
      json['category'].forEach((v) {
        category.add(new Category.fromJson(v));
      });
    }
    title = json['title'];
    address = json['address'];
    deliveryPrice = json['delivery_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.category != null) {
      data['category'] = this.category.map((v) => v.toJson()).toList();
    }
    data['title'] = this.title;
    data['address'] = this.address;
    data['delivery_price'] = this.deliveryPrice;
    return data;
  }
}

class Category {
  int id;
  String name;
  String image;

  Category({this.id, this.name, this.image});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    return data;
  }
}

class Orders {
  int id;
  Product product;
  int count;
  int shopType;
  int user;
  int receipt;

  Orders(
      {this.id,
      this.product,
      this.count,
      this.shopType,
      this.user,
      this.receipt});

  Orders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product =
        json['product'] != null ? new Product.fromJson(json['product']) : null;
    count = json['count'];
    shopType = json['shop_type'];
    user = json['user'];
    receipt = json['receipt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.product != null) {
      data['product'] = this.product.toJson();
    }
    data['count'] = this.count;
    data['shop_type'] = this.shopType;
    data['user'] = this.user;
    data['receipt'] = this.receipt;
    return data;
  }
}

class Product {
  int id;
  String name;
  String barcode;
  String description;
  double price;
  String image;
  String createdDate;
  int category;
  int market;
  int status;

  Product(
      {this.id,
      this.name,
      this.barcode,
      this.description,
      this.price,
      this.image,
      this.createdDate,
      this.category,
      this.market,
      this.status});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    barcode = json['barcode'];
    description = json['description'];
    price = json['price'];
    image = json['image'];
    createdDate = json['created_date'];
    category = json['category'];
    market = json['market'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['barcode'] = this.barcode;
    data['description'] = this.description;
    data['price'] = this.price;
    data['image'] = this.image;
    data['created_date'] = this.createdDate;
    data['category'] = this.category;
    data['market'] = this.market;
    data['status'] = this.status;
    return data;
  }
}

