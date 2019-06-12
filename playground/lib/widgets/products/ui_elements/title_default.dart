import 'package:flutter/material.dart';

class DeafaultTitle extends StatelessWidget {
  final String title;
  DeafaultTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: Theme.of(context).primaryColor,
        fontSize: 40.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
