import 'package:flutter/material.dart';

import 'package:grocery_list/screens/home_screen.dart';

import 'package:grocery_list/screens/product_detail_screen.dart';

import 'package:grocery_list/screens/grocery_list_detail_screen.dart';
import 'package:grocery_list/screens/product_list_screen.dart';
import 'package:grocery_list/screens/grocery_list_screen.dart';
import 'package:grocery_list/screens/create_grocery_list_screen.dart';
import 'package:grocery_list/screens/create_product_screen.dart';

class GroceryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/products': (context) => ProductListScreen(),
        '/lists': (context) => GroceryListScreen(),
        '/lists/detail': (context) => GroceryListDetailScreen(),
        '/products/detail': (context) => ProductDetailScreen(),
        '/new-list': (context) => CreateGroceryListScreen(),
        '/new-product': (context) => CreateProductScreen(),
      },
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
    );
  }
}
