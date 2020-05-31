class Products {
  int id;
  String name;
  String barcode;
  String description;
  double price;
  int count = 1;
  String image;
  String createdDate;
  int category;
  int market;
  int order_id;
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

  Products.fromDB(Map<String, dynamic> json) {
    id = json['product_id'];
    order_id = json['order_id'];
    name = json['name'];
    image = json["image"];
    count = json['count'];
    barcode = json['barcode'];
    description = json['description'];
    price = double.parse(json['price']);
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

  Map<String, dynamic> toOrderJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productId'] = this.id;
    data['count'] = this.count;
    return data;
  }

  Map<String, dynamic> toOrderOfflineJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productId'] = this.id;
    data['count'] = this.count;
    return data;
  }

  Map<String, dynamic> toDBJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.id;
    data['count'] = this.count;
    data['image'] = this.image;
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price.toString();
    return data;
  }
}
