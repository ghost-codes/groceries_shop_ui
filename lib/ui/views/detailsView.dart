import 'package:flutter/material.dart';
import 'package:groceries_shop_ui/core/models/groceriesModel.dart';
import 'package:groceries_shop_ui/core/viewModels/detailsModel.dart';
import 'package:groceries_shop_ui/ui/views/baseView.dart';
import 'package:groceries_shop_ui/ui/widgets/groceriesItem.dart';
import 'package:groceries_shop_ui/ui/widgets/universalWidgets.dart';

class DetailsView extends StatelessWidget {
  final Grocery grocery;

  const DetailsView({Key key, this.grocery}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BaseView<DetailsModel>(
      onModelReady: (model) {
        model.getRelatedProd(grocery.type, grocery.imageUrl);
      },
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "Product Details",
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            actions: [CartIcon()],
          ),
          body: ListView(
            children: [
              Container(
                height: 0.6 * MediaQuery.of(context).size.width,
                child: Hero(
                  tag: grocery.imageUrl,
                  child: Image.asset(
                    grocery.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          grocery.groceriesName,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      "${grocery.itemCount} (pieces)",
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "GH ${grocery.price}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        margin: EdgeInsets.all(10.0),
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.green[800],
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Center(
                          child: Text(
                            "ADD TO CART",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        margin: EdgeInsets.all(10.0),
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              color: Colors.green[800],
                              style: BorderStyle.solid,
                              width: 1),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Center(
                          child: Text(
                            "ADD TO WISHLIST",
                            style: TextStyle(
                              color: Colors.green[800],
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      "Product Description",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    SizedBox(height: 15),
                    Text(
                      grocery.detials,
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 15),
                    Text(
                      "Related Products",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Container(
                      height: ((MediaQuery.of(context).size.width - 35) / 2) *
                          (3 / 2),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: model.localGroceries.length,
                        itemBuilder: (context, index) {
                          // print(model.localGroceries);
                          return Padding(
                            padding: const EdgeInsets.all(7.0),
                            child: AspectRatio(
                              aspectRatio: 2 / 3,
                              child: GroceriesItem(
                                  grocery: model.localGroceries[index]),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
