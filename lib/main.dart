import 'package:flutter/material.dart';

import 'package:grocery_list/modules/home/pages/Home.dart';

import 'package:grocery_list/modules/products/pages/ProductDetail.dart';

import 'package:grocery_list/modules/lists/containers/GroceryListDetailContainer.dart';
import 'package:grocery_list/modules/products/containers/ProductContainer.dart';
import 'package:grocery_list/modules/lists/containers/GroceryListContainer.dart';

void main() => runApp(GroceryApp());

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
        '/lists/detail': (context) => GroceryListDetailContainer(),
        '/products/detail': (context) => ProductDetail(),
      },
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
    );
  }
}
