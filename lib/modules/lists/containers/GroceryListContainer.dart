import 'package:flutter/material.dart';

import 'package:grocery_list/modules/lists/pages/GroceryList.dart';

class GroceryListContainer extends StatefulWidget {
  @override
  _GroceryListState createState() => new _GroceryListState();
}

class _GroceryListState extends State<GroceryListContainer> {
  @override
  Widget build(BuildContext context) {
    return GroceryList();
  }
}
