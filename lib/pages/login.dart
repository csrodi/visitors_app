import 'package:flutter/material.dart';
import 'package:visitors_app/business/login_service.dart';
import 'package:visitors_app/entity/user.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  // Create a global key that will uniquely identify the Form widget and allow us to validate the form
  //
  // Note: This is a GlobalKey<FormState>, not a GlobalKey<MyCustomFormState>!
  final _formKey = GlobalKey<FormState>();

  final _loginService = new LoginService();

  User _user = new User();

  Future<void> _showErrorDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Login error'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Bad credentials!'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Retry'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var loginBtn = RaisedButton(
      textColor: Colors.white,
      color: Colors.blue,
      child: SizedBox(
        width: double.infinity,
        child: Center(child: Text('Login')),
      ),
      onPressed: () {
        // Validate will return true if the form is valid, or false if the form is invalid.
        if (_formKey.currentState.validate()) {
          _loginService
              .login(_user.username, _user.password)
              .then((value) => value ? Navigator.of(context).pushReplacementNamed("/home") : _showErrorDialog())
              .catchError(() => _showErrorDialog());
        }
      },
    );

    var loginForm = Column(
      children: <Widget>[
        Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Please, insert your credentials :', style: TextStyle(color: Colors.blue)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  autocorrect: false,
                  decoration: InputDecoration(labelText: 'Username'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'This field cannot be empty';
                    }
                    _user.username = value;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  obscureText: true,
                  autocorrect: false,
                  decoration: InputDecoration(labelText: 'Password'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'This field cannot be empty';
                    }
                    _user.password = value;
                  },
                ),
              ),
            ],
          ),
        ),
        loginBtn
      ],
    );

    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        child: Center(
          child: ClipRect(
            child: Container(
              child: loginForm,
              height: 300.0,
              width: 300.0,
            ),
          ),
        ),
      ),
    );
  }
}
