import 'package:flutter/material.dart';

import 'package:grocery_list/modules/lists/components/GroceryListItem.dart';

import 'package:grocery_list/modules/core/components/Layout.dart';

class GroceryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final lists = <Widget>[ListItem(), ListItem(), ListItem()];

    return Layout(
      title: 'Grocery lists',
      body: Container(
        padding: const EdgeInsets.all(8),
        child: ListView(
          children: lists,
        ),
      ),
    );
  }
}
