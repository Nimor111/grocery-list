import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grocery_list/modules/lists/models/GroceryListModel.dart';
import 'package:grocery_list/modules/products/models/Product.dart';

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

  addProductToList(Product product, String id) async {
    final DocumentReference listRef =
        Firestore.instance.document('lists/' + id);

    Firestore.instance.runTransaction((Transaction tx) async {
      final DocumentSnapshot listSnapshot = await tx.get(listRef);

      Map<String, dynamic> newProductMap = product.toJson();

      if (listSnapshot.exists) {
        await tx.update(listRef, <String, dynamic>{
          'products': FieldValue.arrayUnion([newProductMap]),
        }).catchError((e) => print(e));
      }
    });
  }

  removeProductFromList(String listId, Product product) async {
    final DocumentReference listRef =
        Firestore.instance.document('lists/' + listId);

    Firestore.instance.runTransaction((Transaction tx) async {
      final DocumentSnapshot listSnapshot = await tx.get(listRef);

      Map<String, dynamic> productMap = product.toJson();
      if (listSnapshot.exists) {
        await tx.update(listRef, <String, dynamic>{
          'products': FieldValue.arrayRemove([productMap]),
        }).catchError((e) => print(e));
      }
    });
  }
}
