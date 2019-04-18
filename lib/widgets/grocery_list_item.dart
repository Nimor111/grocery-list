import 'package:flutter/material.dart';
import 'package:grocery_list/models/grocery_list_model.dart';

import 'package:grocery_list/widgets/inherited/with_delete.dart';

class ListItem extends StatelessWidget {
  ListItem({this.list});

  final GroceryListModel list;

  void _pushListDetail(BuildContext context) {
    Navigator.pushNamed(context, '/lists/detail', arguments: this.list);
  }

  @override
  Widget build(BuildContext context) {
    final deleteList = WithDelete.of(context);
    return Container(
      padding: const EdgeInsets.all(8),
      child: Card(
        child: Column(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.list),
              title: Text(list != null ? list.name : 'List name'),
              subtitle: Text('Number of products'),
              onTap: () => _pushListDetail(context),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  deleteList.delete(list.documentID);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
