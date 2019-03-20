import 'package:flutter/material.dart';

import 'package:grocery_list/modules/core/components/GroceryDrawer.dart';
import 'package:grocery_list/modules/core/components/GroceryBar.dart';

class ProductDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: GroceryDrawer(),
      appBar: GroceryBar(title: 'Product detail'),
      body: ListView(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(32),
            child: Image.asset('images/default.png', width: 300, height: 300, fit: BoxFit.contain),
          ),
          Container(
            padding: const EdgeInsets.all(32),
            child: Column(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    'Product name',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 32)
                  ),
                ),
                Text(
                  'This is a pretty awesome product that you should buy, like seriously.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
