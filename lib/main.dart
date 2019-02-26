import 'package:flutter/material.dart';

import 'package:grocery_list/modules/home/components/Home.dart';
import 'package:grocery_list/modules/products/containers/ProductContainer.dart';

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
      },
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
    );
  }
}
