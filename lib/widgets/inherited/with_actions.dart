import 'package:flutter/material.dart';

class WithActions extends InheritedWidget {
  final Map<String, Function> actions;

  const WithActions({Key key, @required this.actions, @required Widget child})
      : super(key: key, child: child);

  static WithActions of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(WithActions) as WithActions;
  }

  @override
  bool updateShouldNotify(WithActions old) => actions != old.actions;
}
