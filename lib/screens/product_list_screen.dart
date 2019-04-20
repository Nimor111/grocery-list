import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:grocery_list/widgets/product_list.dart';
import 'package:grocery_list/widgets/layout.dart';
import 'package:grocery_list/models/product.dart';

import 'package:grocery_list/services/product_service.dart';

class ProductListScreen extends StatefulWidget {
  @override
  _ProductListScreenState createState() => new _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  ProductService productService = ProductService();

  void _pushAddProduct(BuildContext context) {
    Navigator.pushNamed(context, '/new-product');
  }

  @override
  Widget build(BuildContext context) {
    final dynamic args = ModalRoute.of(context).settings.arguments;

    return new StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('products').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return LinearProgressIndicator();
        }

        final products = getProducts(snapshot.data.documents);

        return Layout(
          title: 'Available products',
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () => _pushAddProduct(context),
          ),
          body: ProductList(
              products: products,
              inAddProducts: (args == null || args['inAddProducts'] == null)
                  ? false
                  : args['inAddProducts']),
        );
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
