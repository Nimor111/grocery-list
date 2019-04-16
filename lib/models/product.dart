import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  String documentID;
  String name;
  String description;
  DocumentReference reference;

  Product({this.documentID, this.name, this.description, this.reference});

  Product.fromMap(String documentID, Map<String, dynamic> map, {this.reference})
      : assert(map['name'] != null),
        documentID = documentID,
        name = map['name'],
        description = map['description'];

  Product.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.documentID, snapshot.data,
            reference: snapshot.reference);

  Map<String, dynamic> toJson() => {'name': name, 'description': description};

  @override
  String toString() => "Product<$name>";
}
