import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grocery_list/models/grocery_list_model.dart';
import 'package:grocery_list/models/product.dart';

class GroceryListService {
  GroceryListService();

  final CollectionReference _listsReference =
      Firestore.instance.collection('lists');

  Future<List<GroceryListModel>> getLists() async {
    final QuerySnapshot listsSnapshot =
        await Firestore.instance.collection('lists').getDocuments();

    final Future<List<GroceryListModel>> lists =
        Future.wait<GroceryListModel>(listsSnapshot.documents.map((l) async {
      final GroceryListModel list = GroceryListModel.fromSnapshot(l);
      return list;
    }));

    return lists;
  }

  Future<GroceryListModel> getSingleList(String documentID) async {
    DocumentSnapshot listSnapshot =
        await Firestore.instance.collection('lists').document(documentID).get();

    GroceryListModel list = GroceryListModel.fromSnapshot(listSnapshot);
    list.products = (await getListProducts(list.productRefs))
        .where((product) => product != null)
        .toList();

    return list;
  }

  Future<List<Product>> getListProducts(
      List<DocumentReference> products) async {
    return Future.wait<Product>(products.map((product) async {
      final DocumentSnapshot snapshot = await product.get();
      // TODO this is a workaround, think of a way to clear product from a list once it is deleted
      if (snapshot.exists) {
        return Product.fromSnapshot(snapshot);
      }
    }));
  }

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

  addProductToList(DocumentReference productRef, String id) async {
    final DocumentReference listRef =
        Firestore.instance.document('lists/' + id);

    Firestore.instance.runTransaction((Transaction tx) async {
      final DocumentSnapshot listSnapshot = await tx.get(listRef);

      if (listSnapshot.exists) {
        await tx.update(listRef, <String, dynamic>{
          'products': FieldValue.arrayUnion([productRef]),
        }).catchError((e) => print(e));
      }
    });
  }

  removeProductFromList(String listId, DocumentReference productRef) async {
    final DocumentReference listRef =
        Firestore.instance.document('lists/' + listId);

    Firestore.instance.runTransaction((Transaction tx) async {
      final DocumentSnapshot listSnapshot = await tx.get(listRef);

      if (listSnapshot.exists) {
        await tx.update(listRef, <String, dynamic>{
          'products': FieldValue.arrayRemove([productRef]),
        }).catchError((e) => print(e));
      }
    });
  }
}
