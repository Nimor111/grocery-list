import 'package:flutter/material.dart';

import 'package:grocery_list/widgets/layout.dart';
import 'package:grocery_list/widgets/camera_storage.dart';

import 'package:grocery_list/models/product.dart';

class ProductDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Product product = ModalRoute.of(context).settings.arguments;

    final String name = product == null ? 'No name' : product.name;
    final String description = product?.description;

    return Layout(
      title: name,
      body: ListView(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(32),
            child: CameraStorage(
                documentID: product.documentID,
                imageUrl: product.imageUrl,
                imageID: product.imageID),
          ),
          Container(
            padding: const EdgeInsets.all(32),
            child: Column(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Text(name,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 32)),
                ),
                Text(
                  description,
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
