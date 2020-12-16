import 'package:groceries_shop_ui/core/enums.dart';
import 'package:groceries_shop_ui/core/models/groceries.dart';
import 'package:groceries_shop_ui/core/models/groceriesModel.dart';
import 'package:groceries_shop_ui/core/viewModels/baseModel.dart';

class DetailsModel extends BaseModel {
  List<Grocery> _groceries = [];

  List<Grocery> get localGroceries => _groceries;

  getRelatedProd(ProductType type, imageUrl) {
    groceries.forEach(
      (e) {
        if (e["type"] == type && e["imageUrl"] != imageUrl) {
          _groceries.add(
            Grocery(
              detials: e["details"],
              imageUrl: e["imageUrl"],
              groceriesName: e["name"],
              price: e["price"],
              itemCount: e["itemCount"],
              type: e["type"],
              weight: e["weight"],
            ),
          );
        }
      },
    );
    notifyListeners();
  }
}
