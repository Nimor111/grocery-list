import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:grocery_list/modules/products/ProductList.dart';
import 'package:grocery_list/modules/products/models/Product.dart';

import 'package:grocery_list/modules/products/services/ProductService.dart';

class ProductContainer extends StatefulWidget {
  @override
  _ProductState createState() => new _ProductState();
}

class _ProductState extends State<ProductContainer> {
  ProductService productService = ProductService();

  @override
  Widget build(BuildContext context) {
    return new StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('products').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return LinearProgressIndicator();
        }

        final products = getProducts(snapshot.data.documents);

        return ProductList(products: products, deleteProduct: deleteProduct);
      },
    );
  }

  void deleteProduct(String id) {
    this.productService.deleteProduct(id);
  }

  List<Product> getProducts(List<DocumentSnapshot> snapshot) {
    return snapshot.map((doc) => Product.fromSnapshot(doc)).toList();
  }
}
