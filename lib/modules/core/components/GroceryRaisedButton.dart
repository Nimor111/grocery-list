import 'package:flutter/material.dart';

class GroceryRaisedButton extends StatelessWidget {
  GroceryRaisedButton({this.color, this.title, this.textColor, this.onPressed});

  final Color color;
  final String title;
  final Color textColor;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: this.color,
      child: Container(
        child: Text(
          this.title,
          style: TextStyle(color: this.textColor),
        ),
      ),
      onPressed: this.onPressed,
    );
  }
}
