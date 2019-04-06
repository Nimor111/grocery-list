import 'package:flutter/material.dart';

import 'package:grocery_list/modules/core/components/Layout.dart';

class CreateProductFormComponent extends StatelessWidget {
  CreateProductFormComponent({@required this.formKey});

  final formKey;

  @override
  Widget build(BuildContext context) {
    return Layout(
      title: 'Create product form',
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
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Description ',
                  ),
                ),
              ),
              RaisedButton(
                onPressed: () {
                  if (formKey.currentState.validate()) {
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Processing Data'),
                      ),
                    );
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        );
      }),
    );
  }
}
