import 'package:flutter/material.dart';

void main() => runApp(GroceryApp());

class GroceryApp extends StatelessWidget {
  Widget _drawer() {
    return SizedBox(
      width: 200,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 80.0,
              child: DrawerHeader(
                child: Container(
                  padding: const EdgeInsets.all(0.0),
                  child: Text(
                    'Actions',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.deepOrange[800],
                ),
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _logoSection(String image, double width, double height) {
    return Image.asset(image, width: width, height: height, fit: BoxFit.cover);
  }

  Widget _titleSection(String text, IconData icon, Color color) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        padding: const EdgeInsets.all(32),
        child: Text(
          text,
          style: TextStyle(fontSize: 32),
        ),
      ),
      Icon(icon, color: color),
    ]);
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: Scaffold(
        drawer: _drawer(),
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Grocery list'),
        ),
        body: ListView(children: [
          _logoSection('images/shopping-cart.png', 300, 200),
          _titleSection(
              'My grocer', Icons.shopping_cart, Colors.deepOrange[800]),
          _homeButtonSection('Lists', Colors.deepOrange[800], () => {}),
          _homeButtonSection('New list', Colors.deepOrange[800], () => {}),
          _homeButtonSection('Products', Colors.deepOrange[800], () => {}),
        ]),
      ),
    );
  }
}
