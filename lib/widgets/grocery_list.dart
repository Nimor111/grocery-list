import 'package:flutter/material.dart';

import 'package:grocery_list/widgets/grocery_list_item.dart';

import 'package:grocery_list/widgets/layout.dart';
import 'package:grocery_list/models/grocery_list_model.dart';

class GroceryList extends StatelessWidget {
  GroceryList({this.lists, this.deleteList});

  final List<GroceryListModel> lists;
  final Function deleteList;

  @override
  Widget build(BuildContext context) {
    // TODO remove duplicate code
    void _pushAddList(BuildContext context) {
      Navigator.pushNamed(context, '/new-list');
    }

    Widget _buildListItem(BuildContext context, int index) {
      return lists != []
          ? ListItem(list: lists[index], deleteList: deleteList)
          : ListItem();
    }

    return Layout(
      title: 'Grocery lists',
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _pushAddList(context),
      ),
      body: PageView(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(8),
            child: ListView.builder(
              itemCount: lists.length,
              itemBuilder: _buildListItem,
              shrinkWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}
