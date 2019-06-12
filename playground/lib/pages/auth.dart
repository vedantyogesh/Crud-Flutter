import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final GlobalKey<FormState> _authKey = GlobalKey<FormState>();
  Map<String, dynamic> _authFields = {
    'email': null,
    'password': null,
    'acceptTerms': false
  };
  DecorationImage _buildBackgroundImage() {
    return DecorationImage(
      fit: BoxFit.cover,
      image: AssetImage('assets/background.jpg'),
      colorFilter:
          ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.dstATop),
    );
  }

  Widget _buildEmailAuthTextField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'E-Mail',
          filled: true,
          fillColor: Colors.white.withOpacity(0.7)),
      keyboardType: TextInputType.emailAddress,
      validator: (String value) {
        if (value.isEmpty ||
            !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                .hasMatch(value)) {
          return 'The Email address is not valid.';
        }
      },
      onSaved: (String value) {
        _authFields['email'] = value;
      },
    );
  }

  Widget _buildPasswordAuthTextField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Password',
          filled: true,
          fillColor: Colors.white.withOpacity(0.7)),
      keyboardType: TextInputType.text,
      obscureText: true,
      validator: (String value) {
        if (value.isEmpty || value.length <= 5) {
          return 'The Password is too short';
        }
      },
      onSaved: (String value) {
        _authFields['password'] = value;
      },
    );
  }

  Widget _buildSwitchTiles() {
    return SwitchListTile(
      title: Text(
        'Accept Terms',
        style: TextStyle(fontSize: 20.0),
      ),
      value: _authFields['acceptTerms'],
      onChanged: (bool value) {
        setState(() {
          _authFields['acceptTerms'] = value;
        });
      },
    );
  }

  void _submitForm() {
    if (!_authKey.currentState.validate() || !_authFields['acceptTerms']) {
      return;
    }
    _authKey.currentState.save();
    Navigator.pushReplacementNamed(context, '/products');
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;
    return Scaffold(
        appBar: AppBar(
          title: Text("Auth Page"),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: _buildBackgroundImage(),
          ),
          // margin: EdgeInsets.all(30.0),
          child: Center(
            child: SingleChildScrollView(
              child: Container(
                width: targetWidth,
                child: Form(
                  key: _authKey,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: _buildEmailAuthTextField(),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: _buildPasswordAuthTextField(),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      _buildSwitchTiles(),
                      SizedBox(
                        height: 10.0,
                      ),
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Text(
                          "Login",
                          style: TextStyle(fontSize: 20.0),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 60.0),
                        textColor: Colors.white,
                        color: Theme.of(context).accentColor,
                        elevation: 5.0,
                        onPressed: _submitForm,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
