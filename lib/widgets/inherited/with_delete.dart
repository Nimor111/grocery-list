import 'package:flutter/material.dart';

class WithDelete extends InheritedWidget {
  final Function delete;

  const WithDelete({Key key, @required this.delete, @required Widget child})
      : super(key: key, child: child);

  static WithDelete of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(WithDelete) as WithDelete;
  }

  @override
  bool updateShouldNotify(WithDelete old) => delete != old.delete;
}
