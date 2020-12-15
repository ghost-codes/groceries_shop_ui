import 'package:flutter/material.dart';
import 'package:groceries_shop_ui/core/enums.dart';
import 'package:groceries_shop_ui/core/models/groceriesModel.dart';
import 'package:groceries_shop_ui/core/viewModels/homeModel.dart';
import 'package:groceries_shop_ui/ui/views/baseView.dart';
import 'package:groceries_shop_ui/ui/widgets/groceriesItem.dart';

class HomeView extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeModel>(
      builder: (context, model, child) {
        return Scaffold(
          key: _scaffoldKey,
          drawer: drawer(),
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.black,
              ),
              onPressed: () {
                _scaffoldKey.currentState.openDrawer();
              },
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
                      Icons.shopping_cart_outlined,
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
                        rightIcon: Icons.menu,
                        function: () {
                          showDialog(
                              context: context,
                              builder: (context) => SortByAlert(
                                    model: model,
                                  ));
                        },
                      ),
                    ],
                  ),
                ),
                SliverPadding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    sliver: Container(
                      child: SliverGrid(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            List<Grocery> items = model.getGroceries();
                            return GroceriesItem(grocery: items[index]);
                          },
                          childCount: model.getGroceries().length,
                        ),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 15.0,
                          crossAxisSpacing: 15.0,
                          childAspectRatio: 2 / 3,
                        ),
                      ),
                    ))
              ],
            ),
          ),
        );
      },
    );
  }

  Drawer drawer() {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 40,
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "User.email",
                      style: TextStyle(fontSize: 18),
                    ),
                    GestureDetector(
                      child: Text(
                        "Edit",
                        style: TextStyle(
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "User.name",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              drawerItem(
                  icon: Icons.location_on_outlined, label: "My Addresses"),
              drawerItem(icon: Icons.credit_card, label: "Digital Payments"),
              drawerItem(icon: Icons.label_outline, label: "Social Offers"),
              drawerItem(icon: Icons.settings_outlined, label: "Settings"),
              drawerItem(icon: Icons.help_outline, label: "Help & FAQ"),
              drawerItem(icon: Icons.login_outlined, label: "Logout"),
              // drawerItem(icon: Icons.location_on_outlined,label: "My Addresses"),
            ],
          )
        ],
      ),
    );
  }

  ListTile drawerItem({IconData icon, String label}) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.green,
      ),
      title: Text(label),
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
      {String left, String right, IconData rightIcon, Function function}) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            left,
            // style: TextStyle(fontWeight: FontWeight.bold),
          ),
          GestureDetector(
            onTap: function,
            child: Row(
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
          ),
        ],
      ),
    );
  }
}

class SortByAlert extends StatefulWidget {
  final HomeModel model;

  const SortByAlert({Key key, this.model}) : super(key: key);
  @override
  _SortByAlertState createState() => _SortByAlertState();
}

class _SortByAlertState extends State<SortByAlert> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "Sort By",
        style: TextStyle(
          color: Colors.green,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: SingleChildScrollView(
        child: Column(
          children: [
            sortByItem("Top Selling", widget.model, SortBy.TopSelling),
            sortByItem("Low to High Prices", widget.model, SortBy.LtoHPrice),
            sortByItem("High to Low Prices", widget.model, SortBy.HtoLPrice),
            sortByItem("Newest", widget.model, SortBy.Newest),
            sortByItem("Alphabetically A-Z", widget.model, SortBy.AlphaAZ),
            sortByItem("Alphabetically Z-A", widget.model, SortBy.AlphaZA),
          ],
        ),
      ),
    );
  }

  sortByItem(String title, HomeModel model, SortBy value) {
    return GestureDetector(
      onTap: () {
        model.setSort(value);
        setState(() {});
      },
      child: Row(
        children: [
          Radio(
            value: value,
            activeColor: Colors.red,
            groupValue: model.sortBy,
            onChanged: (SortBy value) {
              model.setSort(value);
              setState(() {});
            },
          ),
          Text(
            title,
            style: TextStyle(
                // fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
        ],
      ),
    );
  }
}
