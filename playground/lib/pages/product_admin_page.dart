import 'package:flutter/material.dart';

// import './product_create.dart';
import './product_edit.dart';
import './product_list.dart';

class ProductAdminPage extends StatelessWidget {
  final Function addProduct;
  final Function deleteProduct;
  final List<Map<String, dynamic>> products;
  final Function updateProduct;

  ProductAdminPage(
      this.addProduct, this.updateProduct, this.deleteProduct, this.products);

  Widget _buildSideDrawer(BuildContext context) {
    return Drawer(
        child: Column(
      children: <Widget>[
        AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            "Manage Products",
          ),
        ),
        ListTile(
          leading: Icon(Icons.shop),
          title: Text("Products Page"),
          onTap: () {
            Navigator.pushReplacementNamed(context, '/');
          },
        )
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          drawer: _buildSideDrawer(context),
          appBar: AppBar(
            title: Text("Product Manager"),
            bottom: TabBar(
              tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.list),
                  text: 'My Products',
                ),
                Tab(
                  icon: Icon(Icons.create),
                  text: 'Create',
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              ProductList(products, updateProduct, deleteProduct),
              ProductEdit(addProduct: addProduct),
            ],
          )),
    );
  }
}
