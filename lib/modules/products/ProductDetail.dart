import 'package:flutter/material.dart';

import 'package:grocery_list/modules/core/components/Layout.dart';
import 'package:grocery_list/modules/products/models/Product.dart';

class ProductDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Product product = ModalRoute.of(context).settings.arguments;

    return Layout(
      title: 'Product detail',
      body: ListView(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(32),
            child: Image.asset('images/default.png',
                width: 300, height: 300, fit: BoxFit.contain),
          ),
          Container(
            padding: const EdgeInsets.all(32),
            child: Column(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Text(product.name,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 32)),
                ),
                Text(
                  product.description != ""
                      ? product.description
                      : 'No description.',
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
