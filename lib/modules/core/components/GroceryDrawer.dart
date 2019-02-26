import 'package:flutter/material.dart';

class GroceryDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
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
              title: Text('Home'),
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
            ),
            ListTile(
              title: Text('Lists'),
              onTap: () {
                // TODO
                // Navigator.pushNamed(context, '/lists');
              },
            ),
            ListTile(
              title: Text('New list'),
              onTap: () {
                // TODO
                // Navigator.pushNamed(context, '/new-list');
              },
            ),
            ListTile(
              title: Text('Products'),
              onTap: () {
                Navigator.pushNamed(context, '/products');
              },
            ),
          ],
        ),
      ),
    );
  }
}
