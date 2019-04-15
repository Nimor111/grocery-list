import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:grocery_list/modules/products/components/ProductItem.dart';
import 'package:grocery_list/modules/products/ProductList.dart';

import 'package:grocery_list/modules/core/components/Layout.dart';
import 'package:grocery_list/modules/lists/models/GroceryListModel.dart';
import 'package:grocery_list/modules/products/models/Product.dart';
import 'package:grocery_list/modules/lists/services/GroceryListService.dart';

class GroceryListDetail extends StatelessWidget {
  final listService = GroceryListService();

  void _pushAvailableProducts(BuildContext context, GroceryListModel list) {
    Navigator.of(context).pushNamed('/products', arguments: <String, dynamic>{
      'listId': list.documentID,
      'addToList': listService.addProductToList,
    });
  }

  @override
  Widget build(BuildContext context) {
    GroceryListModel list = ModalRoute.of(context).settings.arguments;

    final listProductItems = new StreamBuilder<DocumentSnapshot>(
        stream: Firestore.instance
            .collection('/lists')
            .document(list.documentID)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return LinearProgressIndicator();
          }

          final list = GroceryListModel.fromSnapshot(snapshot.data);
          final products = list.products
              .map((product) => ProductItem(
                  product: product,
                  listId: list.documentID,
                  removeFromList: listService.removeProductFromList))
              .toList();

          return Column(
            children: <Widget>[
              Expanded(
                child: ListView(children: products),
              ),
            ],
          );
        });
    // list.products
    // .map((product) => ProductItem(
    //     product: product,
    //     listId: list.documentID,
    //     removeFromList: listService.removeProductFromList))
    // .toList();

    return Layout(
      title: list.name,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _pushAvailableProducts(context, list),
      ),
      body: listProductItems,
    );
  }
}
