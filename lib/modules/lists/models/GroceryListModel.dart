import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grocery_list/modules/products/models/Product.dart';

class GroceryListModel {
  String documentID;
  String name;
  List<Product> products;
  DocumentReference reference;

  GroceryListModel({this.documentID, this.name, this.products, this.reference});

  GroceryListModel.fromMap(String documentID, Map<String, dynamic> map,
      {this.reference}) {
    assert(map['name'] != null);
    this.documentID = documentID;
    name = map['name'];
    products = List<Product>.from(map['products'].map((product) =>
        Product.fromMap(null, new Map<String, dynamic>.from(product))));
  }

  GroceryListModel.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.documentID, snapshot.data,
            reference: snapshot.reference);

  Map<String, dynamic> toJson() => {
        'name': name,
        'products': products == null
            ? List<Product>()
            : products.map((product) => product.toJson())
      };

  @override
  String toString() => "Grocery List<$name>";
}
