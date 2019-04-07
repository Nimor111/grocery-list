import 'package:flutter/material.dart';

import 'package:grocery_list/modules/products/components/ProductItem.dart';

import 'package:grocery_list/modules/core/components/Layout.dart';
import 'package:grocery_list/modules/products/models/Product.dart';

class ProductList extends StatelessWidget {
  ProductList({@required this.products});

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    //  var products = <Widget>[ProductItem(), ProductItem(), ProductItem()];

    void _pushAddProduct(BuildContext context) {
      Navigator.pushNamed(context, '/new-product');
    }

    return Layout(
      title: 'Products list',
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _pushAddProduct(context),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(8),
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) {
                return products != []
                    ? ProductItem(product: products[index])
                    : ProductItem();
              },
              shrinkWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}
