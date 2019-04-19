import 'package:flutter/material.dart';
import 'package:grocery_list/models/product.dart';
import 'package:grocery_list/widgets/inherited/with_delete.dart';

class ProductItem extends StatefulWidget {
  ProductItem(
      {@required this.product,
      this.listId,
      this.removeFromList,
      this.addToList});

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

  Widget _leadingSection() {
    return widget.listId != null
        ? IconButton(
            icon: Icon(Icons.done, color: Colors.green),
            onPressed: () {
              this.setState(() {
                enabled = !enabled;
              });
            })
        : Icon(Icons.apps);
  }

  Function _longPressAction() {
    return widget.addToList != null
        ? () {
            widget.addToList(widget.product, widget.listId);
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text("Product added!"),
            ));
          }
        : () {};
  }

  Function _dismissedAction() {
    final deleteWidget = WithDelete.of(context);
    return deleteWidget != null
        ? () {
            deleteWidget.delete(widget.product.documentID);

            _showSnackbar(context, "Product deleted");
          }
        : () {
            widget.removeFromList(widget.listId, widget.product);

            _showSnackbar(context, "Product removed from list");
          };
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Card(
        child: Column(
          children: <Widget>[
            Dismissible(
              key: Key(widget.product.documentID),
              onDismissed: (_direction) {
                final Function action = _dismissedAction();
                action();
              },
              child: ListTile(
                leading: _leadingSection(),
                enabled: enabled,
                title: Text(widget.product.name),
                subtitle: Text('Amount'),
                onTap: () => _pushProductDetail(context),
                onLongPress: () {
                  final Function action = _longPressAction();
                  action();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
