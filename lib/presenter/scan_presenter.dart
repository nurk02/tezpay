import 'package:tezpay/database/database_helper.dart';
import 'package:tezpay/network/rest.dart';
import 'package:tezpay/models/Products.dart';

abstract class ScanPageContract {
  void onSuccess(Products products);
  void onSuccessList(List<Products> products);
  void onSuccessInserted();
  void onSuccessDeleted();
  void onError(String error);
}

class ScanPagePresenter {
  ScanPageContract _view;

  ScanPagePresenter(this._view);

  getProductList() {
    var db = DatabaseHelper();
    db
        .getOrderOffline()
        .then((value) => _view.onSuccessList(value))
        .catchError((error) => _view.onError(error));
  }

  insertProduct(Products products) {
    var db = DatabaseHelper();
    db
        .insertOrderOffline(products)
        .then((value) => _view.onSuccessInserted())
        .catchError((error) => _view.onError(error));
  }

  deleteProduct(int id) {
    var db = DatabaseHelper();
    db
        .deleteProductOrderOffline(id)
        .then((value) => _view.onSuccessDeleted())
        .catchError((error) => _view.onError(error));
  }

  decreaseProduct(int id) {
    var db = DatabaseHelper();
    db
        .decreaseProduct(id)
        .then((value) => _view.onSuccessDeleted())
        .catchError((error) => _view.onError(error.toString()));
  }

  increaseProduct(int id) {
    var db = DatabaseHelper();
    db
        .increaseProduct(id)
        .then((value) => _view.onSuccessDeleted())
        .catchError((error) => _view.onError(error.toString()));
  }

  getProductInfo(String id) {
    Rest()
        .getBarCodeInfo(id)
        .then((value) => _view.onSuccess(value))
        .catchError((error) => _view.onError(error));
    ;
  }
}
