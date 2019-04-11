import 'package:flutter/material.dart';

import 'package:grocery_list/modules/products/components/ProductItem.dart';

import 'package:grocery_list/modules/core/components/Layout.dart';
import 'package:grocery_list/modules/products/models/Product.dart';

class ProductList extends StatelessWidget {
  ProductList({@required this.products, this.deleteProduct});

  final List<Product> products;
  final Function deleteProduct;

  @override
  Widget build(BuildContext context) {
    void _pushAddProduct(BuildContext context) {
      Navigator.pushNamed(context, '/new-product');
    }

    Widget _buildProductItem(BuildContext context, int index) {
      return products != []
          ? ProductItem(product: products[index], deleteProduct: deleteProduct)
          : ProductItem();
    }

    return Layout(
      title: 'All products',
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _pushAddProduct(context),
      ),
      body: PageView(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(8),
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: _buildProductItem,
              shrinkWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}
