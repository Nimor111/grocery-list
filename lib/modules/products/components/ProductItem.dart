import 'package:flutter/material.dart';
import 'package:grocery_list/modules/products/models/Product.dart';

class ProductItem extends StatelessWidget {
  ProductItem({this.product, this.deleteProduct});

  final Product product;
  final Function deleteProduct;

  void _pushProductDetail(BuildContext context) {
    Navigator.pushNamed(context, '/products/detail', arguments: this.product);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Card(
        child: Column(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.album),
              title: Text(product != null ? product.name : 'Product name'),
              subtitle: Text('Amount'),
              onTap: () => _pushProductDetail(context),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  deleteProduct(product.documentID);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
