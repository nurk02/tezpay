import 'package:tezpay/database/database_helper.dart';
import 'package:tezpay/network/rest.dart';
import 'package:tezpay/models/User.dart';

abstract class SignupPageContract {
  void onSuccess(User user);
  void onError(String error);
}

class SignupPagePresenter {
  SignupPageContract _view;

  SignupPagePresenter(this._view);

  fetchSignUp(String username, String password) {
    Rest().postSignUp(username, password).then((value) {
      
      _view.onSuccess(value);
    }).catchError((error) => _view.onError(error));
  }
}
