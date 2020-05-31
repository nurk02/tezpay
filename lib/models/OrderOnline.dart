import 'Products.dart';

class OrderRequest {
  List<Products> productIds;
  String address;

  OrderRequest({this.productIds, this.address});
  OrderRequest.fromJson(Map<String, dynamic> json) {
    if (json['productIds'] != null) {
      productIds = new List<Products>();
      json['productIds'].forEach((v) {
        productIds.add(new Products.fromJson(v));
      });
    }
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.productIds != null) {
      data['productIds'] = this.productIds.map((v) => v.toOrderJson()).toList();
    }
    data['address'] = this.address;
    return data;
  }

  Map<String, dynamic> toOfflineJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.productIds != null) {
      data['productIds'] = this.productIds.map((v) => v.toOrderJson()).toList();
    }
    return data;
  }
}

class ProductIds {
  int count;
  int productId;

  ProductIds({this.count, this.productId});

  ProductIds.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    productId = json['productId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['productId'] = this.productId;
    return data;
  }
}
