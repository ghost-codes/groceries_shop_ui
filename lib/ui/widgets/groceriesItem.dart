import 'package:flutter/material.dart';
import 'package:groceries_shop_ui/core/models/groceriesModel.dart';

class GroceriesItem extends StatelessWidget {
  final Grocery grocery;

  const GroceriesItem({Key key, this.grocery}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 1.0,
            child: Image.asset(
              grocery.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            grocery.groceriesName,
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          Row(
            children: [
              Column(
                children: [
                  Text(
                    "GH ${grocery.price}",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${grocery.weight} (${grocery.itemCount} pieces)",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              CircleAvatar(
                radius: 10,
                backgroundColor: Colors.green,
                child: Icon(Icons.add),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
