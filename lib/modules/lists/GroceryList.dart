import 'package:flutter/material.dart';

import 'package:grocery_list/modules/lists/components/GroceryListItem.dart';

import 'package:grocery_list/modules/core/components/Layout.dart';

class GroceryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final lists = <Widget>[ListItem(), ListItem(), ListItem()];

    // TODO remove duplicate code
    void _pushAddList(BuildContext context) {
      Navigator.pushNamed(context, '/new-list');
    }

    return Layout(
      title: 'Grocery lists',
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _pushAddList(context),
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: ListView(
          children: lists,
        ),
      ),
    );
  }
}
