import 'package:flutter/material.dart';

import 'package:grocery_list/widgets/grocery_list.dart';
import 'package:grocery_list/models/grocery_list_model.dart';
import 'package:grocery_list/services/grocery_list_service.dart';

class GroceryListScreen extends StatefulWidget {
  @override
  _GroceryListScreenState createState() => new _GroceryListScreenState();
}

class _GroceryListScreenState extends State<GroceryListScreen> {
  GroceryListService listService = GroceryListService();

  @override
  Widget build(BuildContext context) {
    return new FutureBuilder<List<GroceryListModel>>(
      future: listService.getLists(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return LinearProgressIndicator();
        }

        return GroceryList(lists: snapshot.data);
      },
    );
  }

  void deleteList(String id) {
    this.listService.deleteList(id);
  }
}
