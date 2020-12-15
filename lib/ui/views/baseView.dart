import 'package:flutter/material.dart';
import 'package:groceries_shop_ui/core/viewModels/baseModel.dart';
import 'package:groceries_shop_ui/locator.dart';
import 'package:provider/provider.dart';

class BaseView<T extends BaseModel> extends StatefulWidget {
  final Function(BuildContext context, T model, Widget child) builder;

  BaseView({this.builder});

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseModel> extends State<BaseView<T>> {
  T model = sl<T>();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
      value: model,
      child: Consumer<T>(
        builder: widget.builder,
      ),
    );
  }
}
