import 'package:tezpay/models/MenuModel.dart';
import 'package:tezpay/network/rest.dart';

abstract class MenuPageContract {
  void onSuccess(MenuModel menuModel);
  void onError(String error);
}

class MenuPagePresenter {
  MenuPageContract _view;

  MenuPagePresenter(this._view);

  fetchMenuInfo({int categoryId, int marketId}) {
    Rest()
        .getMenuInfo(categoryId: categoryId, marketId: marketId)
        .then((value) => _view.onSuccess(value))
        .catchError((error) => _view.onError(error));
  }
}
