import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grocery_list/modules/products/models/Product.dart';

class ProductService {
  ProductService();

  addProduct(Product newProduct) async {
    final CollectionReference productsReference =
        Firestore.instance.collection('products');

    Firestore.instance.runTransaction((Transaction tx) async {
      await productsReference.add(newProduct.toJson());
    });
  }
}
