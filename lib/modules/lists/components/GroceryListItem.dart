import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  void _pushListDetail(BuildContext context) {
    Navigator.pushNamed(context, '/lists/detail');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Card(
        child: Column(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.list),
              title: Text('List Item'),
              subtitle: Text('Number of products'),
              onTap: () => _pushListDetail(context),
            ),
          ],
        ),
      ),
    );
  }
}
