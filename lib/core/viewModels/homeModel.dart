import 'package:groceries_shop_ui/core/models/groceries.dart';
import 'package:groceries_shop_ui/core/models/groceriesModel.dart';
import 'package:groceries_shop_ui/core/viewModels/baseModel.dart';
import 'package:groceries_shop_ui/ui/widgets/groceriesItem.dart';

class HomeModel extends BaseModel {
  List<String> _categories = [
    "Fruit",
    "Vegetables",
    "Drinks",
    "Meat",
    "Spread",
    "Conduments"
  ];

  List get categories => _categories;

  List<Grocery> getGroceries() {
    List<Grocery> groceryitems;
    groceryitems = groceries.map((e) {
      Grocery grocery = Grocery();
      grocery.groceriesName = e["name"];
      grocery.itemCount = e["itemCount"];
      grocery.type = e["type"];
      grocery.detials = e["details"];
      grocery.imageUrl = e["imageUrl"];
      grocery.price = e["price"];
      grocery.weight = e["weight"];

      return grocery;
    }).toList();
    return groceryitems;
  }
}
