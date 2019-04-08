import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  String name;
  String description;
  DocumentReference reference;

  Product({this.name, this.description, this.reference});

  Product.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['name'] != null),
        name = map['name'],
        description = map['description'];

  Product.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  Map<String, dynamic> toJson() => {'name': name, 'description': description};

  @override
  String toString() => "Product<$name>";
}
