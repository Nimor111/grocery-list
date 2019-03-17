import 'package:flutter/material.dart';

import 'package:grocery_list/modules/products/components/ProductItem.dart';
import 'package:grocery_list/modules/core/components/GroceryBar.dart';
import 'package:grocery_list/modules/core/components/GroceryDrawer.dart';

class GroceryListDetail extends StatelessWidget {
  final products = <Widget>[ProductItem(), ProductItem(), ProductItem()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GroceryBar(title: 'List detail'),
      drawer: GroceryDrawer(),
      body: ListView(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(32),
            child: RaisedButton(
              color: Colors.deepOrange[800],
              child: Container(
                child: Text(
                  'Add product',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              onPressed: () => {},
            ),
          ),
          ListView.builder(
            itemCount: products.length,
            itemBuilder: (BuildContext context, int index) {
              return products[index];
            },
            shrinkWrap: true,
          ),
        ],
      ),
    );
  }
}
