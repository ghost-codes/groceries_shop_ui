import 'package:groceries_shop_ui/core/enums.dart';

class Grocery {
  String imageUrl;
  String groceriesName;
  String detials;
  String weight;
  int itemCount;
  int price;
  ProductType type;

  Grocery({
    this.imageUrl,
    this.groceriesName,
    this.detials,
    this.weight,
    this.itemCount,
    this.price,
    this.type,
  });
}
