import 'package:flutter/material.dart';
import 'package:groceries_shop_ui/core/enums.dart';

class BaseModel extends ChangeNotifier {
  ViewState _state = ViewState.Idle;

  ViewState get state => _state;
  setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }
}
