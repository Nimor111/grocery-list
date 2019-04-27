import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  String documentID;
  String name;
  String description;
  String imageUrl;
  String imageID;
  DocumentReference reference;

  Product(
      {this.documentID,
      this.name,
      this.description,
      this.imageUrl,
      this.imageID,
      this.reference});

  Product.fromMap(String documentID, Map<String, dynamic> map, {this.reference})
      : assert(map['name'] != null),
        documentID = documentID,
        name = map['name'],
        description = map['description'],
        imageUrl = map['imageUrl'],
        imageID = map['imageID'];

  Product.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.documentID, snapshot.data,
            reference: snapshot.reference);

  Map<String, dynamic> toJson() => {
        'name': name,
        'description': description,
        'imageUrl': imageUrl,
        'imageID': imageID,
      };

  @override
  String toString() => "Product<$name>";
}
