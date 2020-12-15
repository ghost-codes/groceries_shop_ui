import 'package:flutter/material.dart';

class CartIcon extends StatefulWidget {
  @override
  _CartIconState createState() => _CartIconState();
}

class _CartIconState extends State<CartIcon> {
  @override
  Widget build(BuildContext context) {
    return Stack(
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
    );
  }
}
