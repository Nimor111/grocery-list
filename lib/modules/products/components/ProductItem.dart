import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  void _pushProductDetail(BuildContext context) {
    Navigator.pushNamed(context, '/products/detail');
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
              title: Text('Product Item'),
              subtitle: Text('Amount'),
              onTap: () => _pushProductDetail(context),
            ),
          ],
        ),
      ),
    );
  }
}
