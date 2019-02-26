import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Card(
        child: Column(
          children: <Widget>[
            const ListTile(
              leading: Icon(Icons.album),
              title: Text('Product Item'),
              subtitle: Text('Amount'),
            )
          ],
        ),
      ),
    );
  }
}
