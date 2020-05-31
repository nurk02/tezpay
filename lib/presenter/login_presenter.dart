import 'package:tezpay/database/database_helper.dart';
import 'package:tezpay/network/rest.dart';
import 'package:tezpay/models/User.dart';

abstract class LoginPageContract {
  void onSuccess(User user);
  void onSuccessSecurity(User user);
  void onError(String error);
}

class LoginPagePresenter {
  LoginPageContract _view;

  LoginPagePresenter(this._view);

  fetchLoginInfo(String username, String password) {
    Rest().postAuth(username, password).then((value) {
      var db = DatabaseHelper();
      db.saveUser(value);

      if (value.type == "security") {
        _view.onSuccessSecurity(value);
      } else {
        _view.onSuccess(value);
      }
    }).catchError((error) => _view.onError(error));
  }

  fetchSignUp(String username, String password) {
    Rest().postSignUp(username, password).then((value) {
      _view.onSuccess(value);
      var db = DatabaseHelper();
      db.saveUser(value);
    }).catchError((error) => _view.onError(error));
  }
}
