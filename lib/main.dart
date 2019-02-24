import 'package:flutter/material.dart';

void main() => runApp(GroceryApp());

class GroceryApp extends StatelessWidget {
  Widget _homeButtonSection(String text, Color color) {
    return Container(
      padding: const EdgeInsets.only(left: 32, right: 32, bottom: 8, top: 8),
      child: RaisedButton(
        color: color,
        child: Container(
          child: Text(text, style: TextStyle(
              color: Colors.white,
            )
          ),
        ),
        onPressed: () => {}
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Grocery list'),
        ),
        body: ListView(children: [
          Image.asset('images/shopping-cart.png', width: 300, height: 200, fit: BoxFit.cover),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              padding: const EdgeInsets.all(32),
              child: Text('My grocer', style: TextStyle(fontSize: 32))),
            Icon(Icons.shopping_cart, color: Colors.deepOrange[800]),
          ]),
          _homeButtonSection('Lists', Colors.deepOrange[800]),
          _homeButtonSection('New list', Colors.deepOrange[800]),
          _homeButtonSection('Products', Colors.deepOrange[800]),
        ]),
      ),
    );
  }
}
