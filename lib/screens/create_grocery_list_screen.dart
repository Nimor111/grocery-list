import 'package:flutter/material.dart';

import 'package:grocery_list/services/grocery_list_service.dart';
import 'package:grocery_list/models/grocery_list_model.dart';
import 'package:grocery_list/widgets/layout.dart';

class CreateGroceryListScreen extends StatefulWidget {
  @override
  _CreateGroceryListScreenState createState() =>
      new _CreateGroceryListScreenState();
}

class _CreateGroceryListScreenState extends State<CreateGroceryListScreen> {
  final formKey = GlobalKey<FormState>();
  GroceryListService listService = GroceryListService();

  String _name;

  _saveForm(BuildContext context) {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();

      final GroceryListModel newGroceryList = new GroceryListModel(name: _name);

      listService.addGroceryList(newGroceryList).catchError((e) {
        return _showError(context);
      });

      Navigator.of(context).pushNamed('/lists');
    }
  }

  // TODO remove duplicate code
  // TODO this does not work - context error
  _showError(BuildContext context) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text('Error while submitting form!'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      title: 'Create List',
      body: Builder(
        builder: (BuildContext context) {
          return Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(16),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Name *',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                    },
                    onSaved: (value) => _name = value,
                  ),
                ),
                RaisedButton(
                  onPressed: () => _saveForm(context),
                  child: Text('Submit'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
