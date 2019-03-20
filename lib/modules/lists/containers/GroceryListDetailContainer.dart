import 'package:flutter/material.dart';

import 'package:grocery_list/modules/lists/pages/GroceryListDetail.dart';

class GroceryListDetailContainer extends StatefulWidget {
  @override
  _GroceryListDetailState createState() => new _GroceryListDetailState();
}

class _GroceryListDetailState extends State<GroceryListDetailContainer> {
  @override
  Widget build(BuildContext context) {
    return GroceryListDetail();
  }
}
