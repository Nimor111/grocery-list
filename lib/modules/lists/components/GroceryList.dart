import 'package:flutter/material.dart';

import 'package:grocery_list/modules/core/components/GroceryBar.dart';
import 'package:grocery_list/modules/core/components/GroceryDrawer.dart';
import 'package:grocery_list/modules/lists/components/GroceryListItem.dart';

class GroceryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final lists = <Widget>[ListItem(), ListItem(), ListItem()];

    return Scaffold(
      drawer: GroceryDrawer(),
      appBar: GroceryBar(title: 'Grocery lists'),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: ListView(
          children: lists,
        ),
      ),
    );
  }
}
