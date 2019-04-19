import 'package:flutter/material.dart';
import 'package:grocery_list/models/grocery_list_model.dart';

import 'package:grocery_list/widgets/inherited/with_actions.dart';

class ListItem extends StatelessWidget {
  ListItem({@required this.list});

  final GroceryListModel list;

  void _pushListDetail(BuildContext context) {
    Navigator.pushNamed(
      context,
      '/lists/detail',
      arguments: <String, GroceryListModel>{'list': this.list},
    );
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
              key: Key(list.documentID),
              onDismissed: (_direction) {
                actionsWidget.actions["deleteList"](list.documentID);

                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text("List deleted"),
                  ),
                );
              },
              child: ListTile(
                leading: Icon(Icons.list),
                title: Text(list.name),
                subtitle: Text('Number of products'),
                onTap: () => _pushListDetail(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
