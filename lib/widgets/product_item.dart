import 'package:flutter/material.dart';
import 'package:grocery_list/models/product.dart';

class ProductItem extends StatelessWidget {
  ProductItem(
      {this.product,
      this.deleteProduct,
      this.listId,
      this.removeFromList,
      this.addToList});

  final Product product;
  final Function deleteProduct;
  final Function removeFromList;
  final Function addToList;
  final String listId;

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
                onPressed: deleteProduct != null
                    ? () => deleteProduct(product.documentID)
                    : () => removeFromList(listId, product),
              ),
              onLongPress: addToList != null
                  ? () {
                      addToList(product, listId);
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text("Product added!"),
                      ));
                    }
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
