import 'package:flutter/material.dart';
import 'package:groceries_shop_ui/core/models/groceriesModel.dart';
import 'package:groceries_shop_ui/core/viewModels/homeModel.dart';
import 'package:groceries_shop_ui/ui/views/baseView.dart';
import 'package:groceries_shop_ui/ui/widgets/groceriesItem.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeModel>(
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                onPressed: () {},
              ),
              Stack(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.shopping_bag_outlined,
                      color: Colors.black,
                    ),
                    onPressed: () {},
                  ),
                  true
                      ? Positioned(
                          right: 5,
                          top: 5,
                          child: CircleAvatar(
                            backgroundColor: Colors.red,
                            radius: 10,
                            child: Text(
                              "3",
                              style: TextStyle(color: Colors.white),
                            ),
                          ))
                      : SizedBox.shrink(),
                ],
              ),
            ],
            title: Row(
              children: [
                Text(
                  "Go",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.w900,
                    fontSize: 25,
                  ),
                ),
                Text(
                  "Cart",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 25,
                  ),
                ),
              ],
            ),
          ),
          body: Container(
            child: CustomScrollView(
              slivers: <Widget>[
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      headerWithRightClickable(
                          left: "EXPLORE CATEGORIES", right: "View All"),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 50,
                        child: Container(
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: model.categories.length + 1,
                            itemBuilder: (context, index) {
                              if (index == 0) {
                                return SizedBox(
                                  width: 15,
                                );
                              }
                              return _cartegoryItem(
                                  model.categories[index - 1]);
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      headerWithRightClickable(
                          left: "TOP SELLING PRODUCTS",
                          right: "Sort",
                          rightIcon: Icons.menu),
                    ],
                  ),
                ),
                SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      List<Grocery> items = model.getGroceries();
                      return GroceriesItem(grocery: items[index]);
                    },
                    childCount: model.getGroceries().length,
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                    childAspectRatio: 2 / 3,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _cartegoryItem(String category) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xffE9F2E5),
          borderRadius: BorderRadius.circular(30),
        ),
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.all(2),
        child: Text(
          category,
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }

  Widget headerWithRightClickable(
      {String left, String right, IconData rightIcon}) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            left,
            // style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              rightIcon == null
                  ? SizedBox.shrink()
                  : Icon(rightIcon, color: Colors.green),
              Text(
                right,
                style: TextStyle(color: Colors.green),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
