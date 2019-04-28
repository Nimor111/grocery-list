import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grocery_list/models/product.dart';

class GroceryListModel {
  String documentID;
  String name;
  List<DocumentReference> productRefs;
  List<Product> products;
  DocumentReference reference;

  GroceryListModel(
      {this.documentID,
      this.name,
      this.productRefs,
      this.products,
      this.reference});

  GroceryListModel.fromMap(String documentID, Map<String, dynamic> map,
      {this.reference}) {
    assert(map['name'] != null);
    this.documentID = documentID;
    name = map['name'];
    productRefs = List<DocumentReference>.from(map['products']);
  }

  GroceryListModel.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.documentID, snapshot.data,
            reference: snapshot.reference);

  // TODO this is not really needed atm
  Map<String, dynamic> toJson() => {
        'name': name,
        'products': List<Product>(),
        // 'products': products == null
        //     ? List<Product>()
        //     : products.map((product) => product.toJson())
      };

  @override
  String toString() => "Grocery List<$name>";
}
