import 'package:flutter/material.dart';

import 'package:grocery_list/modules/lists/components/CreateGroceryListFormComponent.dart';

class CreateGroceryListForm extends StatefulWidget {
  @override
  _CreateGroceryListFormState createState() => new _CreateGroceryListFormState();
}

class _CreateGroceryListFormState extends State<CreateGroceryListForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return CreateGroceryListFormComponent(formKey: _formKey);
  }
}
