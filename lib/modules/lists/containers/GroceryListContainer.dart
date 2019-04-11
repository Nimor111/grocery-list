import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:grocery_list/modules/lists/GroceryList.dart';
import 'package:grocery_list/modules/lists/models/GroceryListModel.dart';
import 'package:grocery_list/modules/lists/services/GroceryListService.dart';

class GroceryListContainer extends StatefulWidget {
  @override
  _GroceryListState createState() => new _GroceryListState();
}

class _GroceryListState extends State<GroceryListContainer> {
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

        return GroceryList(lists: lists, deleteList: deleteList);
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
