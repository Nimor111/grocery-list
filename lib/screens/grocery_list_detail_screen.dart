import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:grocery_list/widgets/product_item.dart';

import 'package:grocery_list/widgets/layout.dart';
import 'package:grocery_list/models/grocery_list_model.dart';
import 'package:grocery_list/services/grocery_list_service.dart';

class GroceryListDetailScreen extends StatelessWidget {
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

    // TODO move to service as get list products?
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
