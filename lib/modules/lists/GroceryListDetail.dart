import 'package:flutter/material.dart';

import 'package:grocery_list/modules/products/components/ProductItem.dart';

import 'package:grocery_list/modules/core/components/Layout.dart';
import 'package:grocery_list/modules/lists/models/GroceryListModel.dart';
import 'package:grocery_list/modules/lists/services/GroceryListService.dart';

class GroceryListDetail extends StatelessWidget {
  void _pushAvailableProducts(BuildContext context, GroceryListModel list) {
    Navigator.of(context).pushNamed('/products', arguments: <String, dynamic>{
      'listId': list.documentID,
    });
  }

  @override
  Widget build(BuildContext context) {
    GroceryListService listService = GroceryListService();
    GroceryListModel list = ModalRoute.of(context).settings.arguments;
    final listProductItems = list.products
        .map((product) => ProductItem(
            product: product,
            listId: list.documentID,
            removeFromList: listService.removeProductFromList))
        .toList();

    return Layout(
      title: list.name,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _pushAvailableProducts(context, list),
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
