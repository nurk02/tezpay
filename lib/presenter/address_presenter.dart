import 'package:tezpay/database/database_helper.dart';
import 'package:tezpay/models/Address.dart';
import 'package:tezpay/network/rest.dart';

abstract class AddressPageContract {
  void onSuccess(Address address);
  void onSuccessList(List<Address> list);
  void onError(String error);
}

class AddressPagePresenter {
  AddressPageContract _view;

  AddressPagePresenter(this._view);

  fetchAddressList() {
    DatabaseHelper()
        .getAddresses()
        .then((value) => _view.onSuccessList(value))
        .catchError((error) => _view.onError(error));
  }
}
