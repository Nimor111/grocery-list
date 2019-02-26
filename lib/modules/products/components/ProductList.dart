import 'package:flutter/material.dart';

import 'package:grocery_list/modules/core/components/GroceryBar.dart';
import 'package:grocery_list/modules/core/components/GroceryDrawer.dart';

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: GroceryDrawer(),
      appBar: GroceryBar(title: 'Products list'),
      body: Container(
        padding: const EdgeInsets.all(32),
        child: Center(child: Text('Product list')),
      ),
    );
  }
}
