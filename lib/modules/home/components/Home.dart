import 'package:flutter/material.dart';

import 'package:grocery_list/modules/core/components/GroceryBar.dart';
import 'package:grocery_list/modules/core/components/GroceryDrawer.dart';

class Home extends StatelessWidget {
  Widget _logoSection(String image, double width, double height) {
    return Image.asset(image, width: width, height: height, fit: BoxFit.cover);
  }

  Widget _titleSection(String text, IconData icon, Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(32),
          child: Text(
            text,
            style: TextStyle(fontSize: 32),
          ),
        ),
        Icon(icon, color: color),
      ],
    );
  }

  Widget _homeButtonSection(String text, Color color, Function onPressed) {
    return Container(
      padding: const EdgeInsets.only(left: 32, right: 32, bottom: 8, top: 8),
      child: RaisedButton(
        color: color,
        child: Container(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }

  void _pushProducts(context) {
    Navigator.pushNamed(context, '/products');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: GroceryDrawer(),
      backgroundColor: Colors.white,
      appBar: GroceryBar(title: 'Grocery list'),
      body: ListView(children: [
        _logoSection('images/shopping-cart.png', 300, 200),
        _titleSection('My grocer', Icons.shopping_cart, Colors.deepOrange[800]),
        _homeButtonSection('Lists', Colors.deepOrange[800], () => {}),
        _homeButtonSection('New list', Colors.deepOrange[800], () => {}),
        _homeButtonSection('Products', Colors.deepOrange[800], () => _pushProducts(context)),
      ]),
    );
  }
}
