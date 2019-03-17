import 'package:flutter/material.dart';

import 'package:grocery_list/modules/core/components/GroceryBar.dart';
import 'package:grocery_list/modules/core/components/GroceryDrawer.dart';
import 'package:grocery_list/modules/products/components/ProductItem.dart';
import 'package:grocery_list/modules/core/components/GroceryRaisedButton.dart';

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var products = <Widget>[ProductItem(), ProductItem(), ProductItem()];

    return Scaffold(
      drawer: GroceryDrawer(),
      appBar: GroceryBar(title: 'Products list'),
      body: ListView(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(8),
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) {
                return products[index];
              },
              shrinkWrap: true,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(32),
            child: GroceryRaisedButton(
              color: Colors.deepOrange[800],
              title: 'Add new product',
              textColor: Colors.white,
              onPressed: () => {},
            ),
          ),
        ],
      ),
    );
  }
}
