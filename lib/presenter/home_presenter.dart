import 'package:tezpay/models/HomeModel.dart';
import 'package:tezpay/network/rest.dart';

abstract class HomePageContract {
  void onSuccess(HomeModel homeModel);
  void onError(String error);
}

class HomePagePresenter {
  HomePageContract _view;

  HomePagePresenter(this._view);

  fetchHomeInfo(int pk) {
    Rest()
        .getHomeInfo(pk)
        .then((value) => _view.onSuccess(value))
        .catchError((error) => _view.onError(error));
  }
}
