import 'package:flutter/material.dart';
import 'package:grocery_list/models/product.dart';

class ProductItem extends StatefulWidget {
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

  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  bool enabled = true;

  void _pushProductDetail(BuildContext context) {
    Navigator.pushNamed(context, '/products/detail',
        arguments: this.widget.product);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Card(
        child: Column(
          children: <Widget>[
            ListTile(
              leading: IconButton(
                icon: Icon(Icons.done, color: Colors.green),
                onPressed: () {
                  this.setState(() {
                    enabled = !enabled;
                  });
                },
              ),
              enabled: enabled,
              title: Text(widget.product != null
                  ? widget.product.name
                  : 'Product name'),
              subtitle: Text('Amount'),
              onTap: () => _pushProductDetail(context),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: widget.deleteProduct != null
                    ? () => widget.deleteProduct(widget.product.documentID)
                    : () =>
                        widget.removeFromList(widget.listId, widget.product),
              ),
              onLongPress: widget.addToList != null
                  ? () {
                      widget.addToList(widget.product, widget.listId);
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
