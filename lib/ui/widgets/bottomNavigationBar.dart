import 'package:flutter/material.dart';
import 'package:groceries_shop_ui/ui/views/homeView.dart';

class BottomNaviagtion extends StatefulWidget {
  @override
  _BottomNaviagtionState createState() => _BottomNaviagtionState();
}

class _BottomNaviagtionState extends State<BottomNaviagtion> {
  PageController _controller = PageController(initialPage: 0);
  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: [
          HomeView(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
          child: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _pageIndex = index;

            _controller.animateToPage(index,
                duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
          });
        },
        currentIndex: _pageIndex,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat_outlined),
              activeIcon: Icon(Icons.chat),
              label: "Chat"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined),
              activeIcon: Icon(Icons.shopping_bag),
              label: "Orders"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border_outlined),
              activeIcon: Icon(Icons.favorite),
              label: "WishList"),
        ],
      )),
    );
  }
}
