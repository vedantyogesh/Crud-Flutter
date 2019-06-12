import 'package:flutter/material.dart';

import './price_tag.dart';
import './ui_elements/title_default.dart';
import 'address_tag.dart';

class ProductCard extends StatelessWidget {
  final Map<String, dynamic> product;
  final int productIndex;

  ProductCard(this.product, this.productIndex);

  _buildPriceRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        DeafaultTitle(product['title']),
        SizedBox(
          height: 10.0,
        ),
        PriceTag(product['price'].toString())
      ],
    );
  }

  _buildActionButtons(BuildContext context) {
    return ButtonBar(
      children: <Widget>[
        IconButton(
            icon: Icon(Icons.info),
            color: Theme.of(context).accentColor,
            onPressed: () => Navigator.pushNamed<bool>(
                  context,
                  '/product/' + productIndex.toString(),
                )),
        IconButton(
            icon: Icon(Icons.favorite_border),
            color: Theme.of(context).primaryColor,
            onPressed: () => Navigator.pushNamed<bool>(
                  context,
                  '/product/' + productIndex.toString(),
                )),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(product['image']),
          _buildPriceRow(),
          AddressTag(product['description']),
          _buildActionButtons(context),
        ],
      ),
    );
  }
}
