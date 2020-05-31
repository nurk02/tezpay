import 'package:tezpay/models/ReceiptOrderResponse.dart';
import 'package:tezpay/network/rest.dart';

abstract class ReceiptPageContract {
  void onSuccess(ReceiptOrderResponse model);
  void onError(String error);
}

class ReceiptPagePresenter {
  ReceiptPageContract _view;

  ReceiptPagePresenter(this._view);

  fetchReceiptInfo(int pk) {
    Rest()
        .getReceipt(pk)
        .then((value) => _view.onSuccess(value))
        .catchError((error) => _view.onError(error));
  }
}
