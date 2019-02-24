import 'package:flutter/material.dart';

import 'package:grocery_list/modules/products/components/ProductList.dart';

class ProductContainer extends StatefulWidget {
  @override
  ProductState createState() => new ProductState();
}

class ProductState extends State<ProductContainer> {
  @override
  Widget build(BuildContext context) {
    return ProductList();
  }
}
