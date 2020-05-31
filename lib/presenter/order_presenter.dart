import 'package:tezpay/database/database_helper.dart';
import 'package:tezpay/network/rest.dart';
import 'package:tezpay/models/Products.dart';

abstract class OrderPageContract {
  void onSuccess(Products products);
  void onSuccessList(List<Products> products);
  void onSuccessInserted();
  void onSuccessDeleted();
  void onError(String error);
}

class OrderPagePresenter {
  OrderPageContract _view;

  OrderPagePresenter(this._view);

  getProductList() {
    var db = DatabaseHelper();
    db
        .getOrderOnline()
        .then((value) => _view.onSuccessList(value))
        .catchError((error) => _view.onError(error));
  }

  insertProduct(Products products) {
    var db = DatabaseHelper();
    db
        .insertOrderOnline(products)
        .then((value) => _view.onSuccessInserted())
        .catchError((error) => _view.onError(error));
  }

  deleteProduct(int id) {
    var db = DatabaseHelper();
    db
        .deleteProductOrderOnline(id)
        .then((value) => _view.onSuccessDeleted())
        .catchError((error) => _view.onError(error));
  }
}
