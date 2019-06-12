import 'package:flutter/material.dart';

import './product_edit.dart';

class ProductList extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  final Function updateProduct;
  final Function deleteProduct;

  Widget _buildEditButton(BuildContext context, int index) {
    return CircleAvatar(
      child: IconButton(
        icon: Icon(Icons.edit),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return ProductEdit(
                  product: products[index],
                  updateProduct: updateProduct,
                  productIndex: index,
                );
              },
            ),
          );
        },
      ),
    );
  }

  ProductList(this.products, this.updateProduct, this.deleteProduct);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
          onDismissed: (DismissDirection direction) {
            if (direction == DismissDirection.endToStart) {
              deleteProduct(index);
            } else if (direction == DismissDirection.startToEnd) {
            } else {}
          },
          background: Container(
            padding: EdgeInsets.only(right: 10.0),
            alignment: Alignment.centerRight,
            color: Colors.red,
            child: Text(
              "Remove",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
            ),
          ),
          key: Key(products[index]['title']),
          child: Column(
            children: <Widget>[
              ListTile(
                leading: CircleAvatar(
                    backgroundImage: AssetImage(products[index]['image'])),
                title: Text(products[index]['title']),
                subtitle: Text('\$${products[index]['price'].toString()}'),
                trailing: _buildEditButton(context, index),
              ),
              Divider(
                height: 50.0,
              )
            ],
          ),
        );
      },
      itemCount: products.length,
    );
  }
}
