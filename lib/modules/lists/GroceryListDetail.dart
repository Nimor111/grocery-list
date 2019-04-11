import 'package:flutter/material.dart';

import 'package:grocery_list/modules/products/components/ProductItem.dart';

import 'package:grocery_list/modules/core/components/Layout.dart';
import 'package:grocery_list/modules/lists/models/GroceryListModel.dart';

class GroceryListDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GroceryListModel list = ModalRoute.of(context).settings.arguments;
    final listProductItems =
        list.products.map((product) => ProductItem(product: product)).toList();

    return Layout(
      title: list.name,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: null,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(children: listProductItems),
          ),
        ],
      ),
    );
  }
}
