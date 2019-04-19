import 'package:flutter/material.dart';
import 'package:grocery_list/models/product.dart';
import 'package:grocery_list/widgets/inherited/with_delete.dart';

class ProductItem extends StatefulWidget {
  ProductItem({this.product, this.listId, this.removeFromList, this.addToList});

  final Product product;
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

  _showSnackbar(BuildContext context, String message) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final deleteWidget = WithDelete.of(context);
    return Container(
      padding: const EdgeInsets.all(8),
      child: Card(
        child: Column(
          children: <Widget>[
            Dismissible(
              key: Key(widget.product.documentID),
              onDismissed: (_direction) {
                if (deleteWidget != null) {
                  deleteWidget.delete(widget.product.documentID);

                  _showSnackbar(context, "Product deleted");
                } else {
                  widget.removeFromList(widget.listId, widget.product);

                  _showSnackbar(context, "Product removed from list");
                }
              },
              child: ListTile(
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
                onLongPress: widget.addToList != null
                    ? () {
                        widget.addToList(widget.product, widget.listId);
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text("Product added!"),
                        ));
                      }
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
