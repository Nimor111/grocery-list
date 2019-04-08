import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grocery_list/modules/products/models/Product.dart';

class ProductService {
  ProductService();

  final CollectionReference _productsReference =
      Firestore.instance.collection('products');

  addProduct(Product newProduct) async {
    Firestore.instance.runTransaction((Transaction tx) async {
      await this._productsReference.add(newProduct.toJson());
    });
  }

  deleteProduct(String id) async {
    Firestore.instance.runTransaction((Transaction tx) async {
      await this._productsReference.document(id).delete();
    });
  }
}
