import 'package:flutter/material.dart';
import 'package:grocery_list/models/grocery_list_model.dart';

class ListItem extends StatelessWidget {
  ListItem({this.list, this.deleteList});

  final GroceryListModel list;
  final Function deleteList;

  void _pushListDetail(BuildContext context) {
    Navigator.pushNamed(context, '/lists/detail', arguments: this.list);
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
              title: Text(list != null ? list.name : 'List name'),
              subtitle: Text('Number of products'),
              onTap: () => _pushListDetail(context),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  deleteList(list.documentID);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
