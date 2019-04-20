import 'package:flutter/material.dart';

import 'package:grocery_list/widgets/product_item.dart';

import 'package:grocery_list/models/product.dart';

class ProductList extends StatelessWidget {
  ProductList(
      {@required this.products, this.listId, @required this.inAddProducts});

  final List<Product> products;
  final String listId;
  final bool inAddProducts;

  String _getListId(dynamic args) {
    if (listId != null) {
      return listId;
    }

    if (args == null) {
      return null;
    }

    return args['list'].documentID;
  }

  @override
  Widget build(BuildContext context) {
    final dynamic args = ModalRoute.of(context).settings.arguments;

    Widget _buildProductItem(BuildContext context, int index) {
      return products != []
          ? ProductItem(
              product: products[index],
              listId: _getListId(args),
              inAddProducts: inAddProducts,
            )
          : null;
    }

    return PageView(
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
    );
  }
}
