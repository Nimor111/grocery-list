import 'package:flutter/material.dart';

import 'package:grocery_list/modules/lists/services/GroceryListService.dart';
import 'package:grocery_list/modules/lists/models/GroceryListModel.dart';
import 'package:grocery_list/modules/core/components/Layout.dart';

class CreateGroceryListForm extends StatefulWidget {
  @override
  _CreateGroceryListFormState createState() =>
      new _CreateGroceryListFormState();
}

class _CreateGroceryListFormState extends State<CreateGroceryListForm> {
  final formKey = GlobalKey<FormState>();
  GroceryListService listService = GroceryListService();

  String _name;

  _saveForm() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();

      final GroceryListModel newGroceryList = new GroceryListModel(name: _name);

      listService.addGroceryList(newGroceryList).catchError((e) {
        return _showError();
      });

      Navigator.of(context).pushNamed('/lists');
    }
  }

  // TODO remove duplicate code
  // TODO this does not work - context error
  _showError() {
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
                  onPressed: _saveForm,
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
