import 'package:flutter/material.dart';

import 'package:grocery_list/modules/products/components/CreateProductFormComponent.dart';

class CreateProductForm extends StatefulWidget {
  @override
  _CreateProductFormState createState() => new _CreateProductFormState();
}

class _CreateProductFormState extends State<CreateProductForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return CreateProductFormComponent(formKey: _formKey);
  }
}
