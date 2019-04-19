import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:grocery_list/widgets/grocery_list.dart';
import 'package:grocery_list/widgets/inherited/with_actions.dart';
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
    return new StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('lists').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return LinearProgressIndicator();
        }

        final lists = getLists(snapshot.data.documents);

        return WithActions(
          actions: <String, Function>{
            'deleteList': deleteList,
          },
          child: GroceryList(lists: lists),
        );
      },
    );
  }

  void deleteList(String id) {
    this.listService.deleteList(id);
  }

  List<GroceryListModel> getLists(List<DocumentSnapshot> snapshot) {
    return snapshot.map((doc) => GroceryListModel.fromSnapshot(doc)).toList();
  }
}
