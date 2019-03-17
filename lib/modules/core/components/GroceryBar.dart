import 'package:flutter/material.dart';

class GroceryBar extends StatelessWidget implements PreferredSizeWidget {
  GroceryBar({@required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(this.title),
    );
  }

  @override
  Size get preferredSize {
    return new Size.fromHeight(50.0);
  }
}
