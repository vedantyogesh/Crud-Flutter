import 'package:flutter/material.dart';

class AddressTag extends StatelessWidget {
  final String description;

  AddressTag(this.description);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Text(
        description,
        style: TextStyle(
          color: Colors.grey,
          fontSize: 25.0,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
