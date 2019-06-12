import 'package:flutter/material.dart';
import 'dart:async';

import '../widgets/products/ui_elements/title_default.dart';
import '../widgets/products/address_tag.dart';

class ProductPage extends StatelessWidget {
  final String title;
  final String imageUrl;
  final double price;
  final String description;
  ProductPage(this.title, this.imageUrl, this.price, this.description);

  Widget _buildAddressPriceRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Sheetal Vihar',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 15.0,
          ),
        ),
        Spacer(),
        Text(
          '\$' + price.toString(),
          style: TextStyle(
            color: Colors.grey,
            fontSize: 15.0,
          ),
        ),
      ],
    );
  }

  Widget _buildTitlePriceRow() {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: DeafaultTitle(title),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: _buildAddressPriceRow(),
          ),
          SizedBox(
            height: 20.0,
          ),
          AddressTag(description),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context, false);
        Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
          backgroundColor: Colors.deepOrange,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.asset(imageUrl),
            _buildTitlePriceRow(),
          ],
        ),
      ),
    );
  }
}
