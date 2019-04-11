import 'package:flutter/material.dart';

import 'package:grocery_list/modules/home/Home.dart';

import 'package:grocery_list/modules/products/ProductDetail.dart';

import 'package:grocery_list/modules/lists/GroceryListDetail.dart';
import 'package:grocery_list/modules/products/containers/ProductContainer.dart';
import 'package:grocery_list/modules/lists/containers/GroceryListContainer.dart';
import 'package:grocery_list/modules/lists/containers/CreateGroceryListForm.dart';
import 'package:grocery_list/modules/products/containers/CreateProductForm.dart';

void main() {
  runApp(GroceryApp());
}

class GroceryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/products': (context) => ProductContainer(),
        '/lists': (context) => GroceryListContainer(),
        '/lists/detail': (context) => GroceryListDetail(),
        '/products/detail': (context) => ProductDetail(),
        '/new-list': (context) => CreateGroceryListForm(),
        '/new-product': (context) => CreateProductForm(),
      },
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
    );
  }
}
