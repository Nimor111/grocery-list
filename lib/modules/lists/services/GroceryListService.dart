import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grocery_list/modules/lists/models/GroceryListModel.dart';

class GroceryListService {
  GroceryListService();

  final CollectionReference _listsReference =
      Firestore.instance.collection('lists');

  addGroceryList(GroceryListModel newGroceryList) async {
    await this._listsReference.add(newGroceryList.toJson());
  }

  deleteList(String id) async {
    final DocumentReference listRef =
        Firestore.instance.document('lists/' + id);

    Firestore.instance.runTransaction((Transaction tx) async {
      final DocumentSnapshot listSnapshot = await tx.get(listRef);

      if (listSnapshot.exists) {
        await tx.delete(listRef);
      }
    });
  }
}
