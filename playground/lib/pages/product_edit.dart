import 'package:flutter/material.dart';

class ProductEdit extends StatefulWidget {
  final Function addProduct;
  final Function updateProduct;
  final Map<String, dynamic> product;
  final int productIndex;

  ProductEdit(
      {this.addProduct, this.product, this.updateProduct, this.productIndex});

  _ProductEditState createState() => _ProductEditState();
}

class _ProductEditState extends State<ProductEdit> {
  final Map<String, dynamic> _formData = {
    'title': null,
    'description': null,
    'price': null,
    'image': 'assets/food.jpg'
  };
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildTitleTextfield() {
    return TextFormField(
      initialValue: widget.product == null ? '' : widget.product['title'],
      decoration: InputDecoration(labelText: 'Product Title '),
      onSaved: (String value) {
        _formData['title'] = value;
      },
      validator: (String value) {
        if (value.isEmpty || value.length < 5) {
          return 'Title is required and must be greater than 5 letters';
        }
      },
    );
  }

  Widget _buildDescriptionTextfield() {
    return TextFormField(
      initialValue: widget.product == null ? '' : widget.product['description'],
      decoration: InputDecoration(labelText: 'Product Description '),
      maxLines: 5,
      onSaved: (String value) {
        _formData['description'] = value;
      },
      validator: (String value) {
        if (value.isEmpty || value.length < 10) {
          return 'Description is required and must be greater than 10 letters';
        }
      },
    );
  }

  Widget _buildPriceTextField() {
    return TextFormField(
      initialValue:
          widget.product == null ? '' : widget.product['price'].toString(),
      decoration: InputDecoration(labelText: 'Product Price '),
      keyboardType: TextInputType.number,
      onSaved: (String value) {
        _formData['price'] = double.parse(value);
      },
      validator: (String value) {
        if (value.isEmpty ||
            !RegExp(r'^(?:[1-9]\d*|0)?(?:\.\d+)?$').hasMatch(value)) {
          return 'Price is required and should be a number';
        }
      },
    );
  }

  void _submitForm() {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    if (widget.product == null) {
      widget.addProduct(_formData);
    } else {
      widget.updateProduct(widget.productIndex, _formData);
    }
    Navigator.pushNamed(context, '/products');
  }

  Widget _buildPageContent(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;
    final double targetPadding = deviceWidth - targetWidth;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Container(
        margin: EdgeInsets.all(30.0),
        child: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: targetPadding / 2),
            children: <Widget>[
              _buildTitleTextfield(),
              _buildDescriptionTextfield(),
              _buildPriceTextField(),
              SizedBox(
                height: 30.0,
              ),
              RaisedButton(
                color: Theme.of(context).accentColor,
                textColor: Colors.white,
                child: Text('Saved'),
                onPressed: _submitForm,
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Widget pageContent = _buildPageContent(context);
    return widget.product == null
        ? pageContent
        : Scaffold(
            appBar: AppBar(
              title: Text('Edit Products'),
            ),
            body: pageContent,
          );
  }
}
