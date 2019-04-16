import 'package:flutter/material.dart';

import 'package:grocery_list/widgets/product_item.dart';

import 'package:grocery_list/widgets/layout.dart';
import 'package:grocery_list/models/product.dart';

class ProductList extends StatelessWidget {
  ProductList(
      {@required this.products, this.deleteProduct, this.removeFromList});

  final List<Product> products;
  final Function deleteProduct;
  final Function removeFromList;

  @override
  Widget build(BuildContext context) {
    final dynamic args = ModalRoute.of(context).settings.arguments;

    void _pushAddProduct(BuildContext context) {
      Navigator.pushNamed(context, '/new-product');
    }

    Widget _buildProductItem(BuildContext context, int index) {
      return products != []
          ? ProductItem(
              product: products[index],
              deleteProduct: deleteProduct,
              removeFromList: removeFromList,
              listId: args != null ? args['listId'] : null,
              addToList: args != null ? args['addToList'] : null,
            )
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
