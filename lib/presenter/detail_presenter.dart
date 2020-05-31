import 'package:tezpay/database/database_helper.dart';
import 'package:tezpay/models/Products.dart';
import 'package:tezpay/network/rest.dart';

abstract class DetailsPageContract {
  void onSuccess(Products products);
  void onSuccessAdded(String message);
  void onError(String error);
}

class DetailsPagePresenter {
  DetailsPageContract _view;

  DetailsPagePresenter(this._view);

  fetchDetailsInfo(String barcode) {
    Rest()
        .getBarCodeInfo(barcode)
        .then((value) => _view.onSuccess(value))
        .catchError((error) => _view.onError(error));
  }

  insertProduct(Products products){
    DatabaseHelper().insertOrderOnline(products).then((value) => _view.onSuccessAdded("Продукт добавлен в корзину"));
  }
}
