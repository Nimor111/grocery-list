import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grocery_list/models/product.dart';

class ProductService {
  ProductService();

  final CollectionReference _productsReference =
      Firestore.instance.collection('products');

  setProductImage(String productID, String imageID, String imageUrl) async {
    final DocumentReference productRef =
        Firestore.instance.document('products/' + productID);

    Firestore.instance.runTransaction((Transaction tx) async {
      final DocumentSnapshot productSnapshot = await tx.get(productRef);

      if (productSnapshot.exists) {
        await tx.update(productRef, <String, dynamic>{
          'imageID': imageID,
          'imageUrl': imageUrl,
        }).catchError((e) => print(e));
      }
    });
  }

  addProduct(Product newProduct) async {
    await this._productsReference.add(newProduct.toJson());
  }

  deleteProduct(String id) async {
    final DocumentReference productRef =
        Firestore.instance.document('products/' + id);

    Firestore.instance.runTransaction((Transaction tx) async {
      final DocumentSnapshot productSnapshot = await tx.get(productRef);
      if (productSnapshot.exists) {
        await tx.delete(productRef);
      }
    });
  }
}
