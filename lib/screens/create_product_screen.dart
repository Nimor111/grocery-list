import 'package:flutter/material.dart';
import 'package:grocery_list/widgets/layout.dart';

import 'package:grocery_list/models/product.dart';

import 'package:grocery_list/services/product_service.dart';

class CreateProductScreen extends StatefulWidget {
  @override
  _CreateProductScreenState createState() => new _CreateProductScreenState();
}

class _CreateProductScreenState extends State<CreateProductScreen> {
  final formKey = GlobalKey<FormState>();
  ProductService productService = ProductService();

  String _name;
  String _description;

  _saveForm(BuildContext context) {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();

      final Product newProduct =
          new Product(name: _name, description: _description);

      productService.addProduct(newProduct).catchError((e) {
        _showError(context);
      });

      Navigator.of(context).pop();
    }
  }

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
      title: 'Add a new product',
      body: Builder(builder: (BuildContext context) {
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
                      return 'Please enter a name';
                    }
                  },
                  onSaved: (value) => _name = value,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Description ',
                  ),
                  onSaved: (value) => _description = value,
                ),
              ),
              RaisedButton(
                onPressed: () => _saveForm(context),
                child: Text('Submit'),
              ),
            ],
          ),
        );
      }),
    );
  }
}
