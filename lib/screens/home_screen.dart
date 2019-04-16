import 'package:flutter/material.dart';

import 'package:grocery_list/widgets/layout.dart';

class HomeScreen extends StatelessWidget {
  Widget _logoSection(String image, double width, double height) {
    return Container(
      padding: const EdgeInsets.all(32),
      child:
          Image.asset(image, width: width, height: height, fit: BoxFit.contain),
    );
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

  void _pushProducts(BuildContext context) {
    Navigator.pushNamed(context, '/products');
  }

  void _pushLists(BuildContext context) {
    Navigator.pushNamed(context, '/lists');
  }

  void _pushNewList(BuildContext context) {
    Navigator.pushNamed(context, '/new-list');
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      title: 'My grocer',
      body: ListView(children: [
        _logoSection('images/shopping-cart.png', 300, 200),
        _titleSection('My grocer', Icons.shopping_cart, Colors.deepOrange[800]),
        _homeButtonSection(
            'Lists', Colors.deepOrange[800], () => _pushLists(context)),
        _homeButtonSection(
            'New list', Colors.deepOrange[800], () => _pushNewList(context)),
        _homeButtonSection(
            'Products', Colors.deepOrange[800], () => _pushProducts(context)),
      ]),
    );
  }
}
