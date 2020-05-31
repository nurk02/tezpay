class HomeModel {
  Market market;
  List<Products> products;

  HomeModel({this.market, this.products});

  HomeModel.fromJson(Map<String, dynamic> json) {
    market =
        json['market'] != null ? new Market.fromJson(json['market']) : null;
    if (json['products'] != null) {
      products = new List<Products>();
      json['products'].forEach((v) {
        products.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.market != null) {
      data['market'] = this.market.toJson();
    }
    if (this.products != null) {
      data['products'] = this.products.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Market {
  int id;
  List<Category> category;
  String title;
  String address;
  String deliveryPrice;

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

class Products {
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

  Products(
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

  Products.fromJson(Map<String, dynamic> json) {
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

