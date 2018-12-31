import 'package:flutter/material.dart';
import 'package:visitors_app/business/visit_service.dart';
import 'package:visitors_app/entity/visit.dart';
import 'package:visitors_app/entity/visitor.dart';

class SignOutPage extends StatefulWidget {
  SignOutPage({Key key}) : super(key: key);

  @override
  _SignOutPageState createState() => _SignOutPageState();
}

class _SignOutPageState extends State<SignOutPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  // Create a global key that will uniquely identify the Form widget and allow
  // us to validate the form
  //
  // Note: This is a GlobalKey<FormState>, not a GlobalKey<MyCustomFormState>!
  final _formKey = GlobalKey<FormState>();

  final _visitorService = new VisitService();

  List<Visitor> _signedInVisitors = new List();

  Visit _visit = new Visit(visitor: new Visitor(), event: null);

  Future<void> _showDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Sign Out'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Visitor signed out successfully.'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
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
    final Size screenSize = MediaQuery.of(context).size;

    var submitBtn = Container(
      width: screenSize.width,
      child: RaisedButton(
        textColor: Colors.white,
        color: Colors.blue,
        child: SizedBox(
          width: double.infinity,
          child: Center(child: Text('Sign Out')),
        ),
        onPressed: () {
          // Validate will return true if the form is valid, or false if
          // the form is invalid.
          if (_formKey.currentState.validate()) {
            // If the form is valid, we want to show a Snackbar
            _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('Processing Data')));
            _visitorService.signOut(_visit).then((v) => _showDialog().whenComplete(() => Navigator.pop(context)));
          }
        },
      ),
    );

    var signOutForm = Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: 'Last name'),
            validator: (value) {
              if (value.isEmpty) {
                return 'This field cannot be empty';
              }
              _visit.visitor.lastName = value;
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'First name'),
            validator: (value) {
              if (value.isEmpty) {
                return 'This field cannot be empty';
              }
              _visit.visitor.firstName = value;
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Badge'),
            validator: (value) {
              _visit.badge = value;
            },
          ),
          submitBtn
        ],
      ),
    );

    var occurrencesList = Container(padding: EdgeInsets.all(8.0), child: Text('TODO'));

    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('Sign Out'),
        ),
        body: SingleChildScrollView(
            child: Row(
          children: <Widget>[
            Expanded(
              child: Container(padding: EdgeInsets.all(8.0), child: signOutForm),
            ),
            _signedInVisitors.isNotEmpty ? occurrencesList : Container(),
          ],
        )));
  }
}
