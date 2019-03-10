import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Card(
        child: Column(
          children: <Widget>[
            const ListTile(
              leading: Icon(Icons.list),
              title: Text('List Item'),
              subtitle: Text('Number of products'),
            ),
          ],
        ),
      ),
    );
  }
}
