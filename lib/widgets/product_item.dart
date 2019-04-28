import 'package:flutter/material.dart';
import 'package:grocery_list/models/product.dart';
import 'package:grocery_list/widgets/inherited/with_actions.dart';

class ProductItem extends StatefulWidget {
  ProductItem(
      {@required this.product, this.listId, @required this.inAddProducts});

  final Product product;
  final String listId;
  final bool inAddProducts;

  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  bool enabled = true;

  void _pushProductDetail(BuildContext context) {
    Navigator.pushNamed(context, '/products/detail',
        arguments: this.widget.product);
  }

  Widget _leadingSection() {
    return widget.inAddProducts == false && widget.listId != null
        ? IconButton(
            icon: Icon(Icons.done, color: Colors.green),
            onPressed: () {
              this.setState(() {
                enabled = !enabled;
              });
            })
        : Icon(Icons.apps);
  }

  Function _longPressAction(WithActions actionsWidget) {
    return widget.inAddProducts
        ? () {
            actionsWidget.actions['addToList'](
                widget.product.reference, widget.listId);
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text('Product added!'),
            ));
          }
        : () {};
  }

  Function _dismissedAction(WithActions actionsWidget) {
    return widget.listId == null || widget.inAddProducts == true
        ? () {
            actionsWidget.actions['deleteProduct'](widget.product.documentID);
          }
        : () {
            actionsWidget.actions['removeFromList'](
                widget.listId, widget.product.reference);
          };
  }

  @override
  Widget build(BuildContext context) {
    final actionsWidget = WithActions.of(context);
    return Container(
      padding: const EdgeInsets.all(8),
      child: Card(
        child: Column(
          children: <Widget>[
            Dismissible(
              key: Key(widget.product.documentID),
              onDismissed: (_direction) {
                final Function action = _dismissedAction(actionsWidget);
                action();
              },
              child: ListTile(
                leading: _leadingSection(),
                enabled: enabled,
                title: Text(widget.product.name),
                subtitle: Text('Amount'),
                onTap: () => _pushProductDetail(context),
                onLongPress: () {
                  final Function action = _longPressAction(actionsWidget);
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
