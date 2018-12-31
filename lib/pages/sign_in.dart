import 'package:flutter/material.dart';
import 'package:visitors_app/business/visit_service.dart';
import 'package:visitors_app/entity/event.dart';
import 'package:visitors_app/entity/visit.dart';
import 'package:visitors_app/entity/visitor.dart';

class SignInPage extends StatefulWidget {
  SignInPage({Key key, this.event}) : super(key: key);

  final Event event;

  @override
  _SignInPageState createState() => _SignInPageState(event);
}

class _SignInPageState extends State<SignInPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  // Create a global key that will uniquely identify the Form widget and allow
  // us to validate the form
  //
  // Note: This is a GlobalKey<FormState>, not a GlobalKey<MyCustomFormState>!
  final _formKey = GlobalKey<FormState>();

  final _visitorService = new VisitService();

  List<Visitor> _preregisteredVisitors = new List();

  static Event _event;
  Visit _visit = new Visit(visitor: new Visitor(), event: _event);

  _SignInPageState(Event event) {
    _event = event;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _loadVisitorsList());
  }

  void _loadVisitorsList() {
    _visitorService.getRegisteredVisitors().then((l) => setState(() => _preregisteredVisitors = l));
  }

  Future<void> _showDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Sign In'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Visitor signed in successfully.'),
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

    var eventTitle = Container(
        padding: EdgeInsets.all(8.0),
        child: Text(
          '${_event != null ? _event.title : ''}',
          style: TextStyle(color: Colors.blue, fontSize: 30),
        ));

    var submitBtn = Container(
      width: screenSize.width,
      child: RaisedButton(
        textColor: Colors.white,
        color: Colors.blue,
        child: SizedBox(
          width: double.infinity,
          child: Center(child: Text('Sign In')),
        ),
        onPressed: () {
          // Validate will return true if the form is valid, or false if
          // the form is invalid.
          if (_formKey.currentState.validate()) {
            // If the form is valid, we want to show a Snackbar
            _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('Processing Data')));
            _visitorService.signIn(_visit).then((v) => _showDialog().whenComplete(() => Navigator.pop(context)));
          }
        },
      ),
    );

    var signInForm = Form(
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
            decoration: InputDecoration(labelText: 'Phone number'),
            validator: (value) {
              _visit.visitor.phoneNumber = value;
            },
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Email',
              hintText: 'you@example.com',
            ),
            validator: (value) {
              _visit.visitor.email = value;
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Badge'),
            validator: (value) {
              _visit.badge = value;
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Contact'),
            validator: (value) {
              _visit.contact = value;
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
          title: Text('Sign In'),
        ),
        body: ListView(children: <Widget>[
          _event != null ? eventTitle : Container(),
          Row(children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(8.0),
                child: signInForm,
              ),
            ),
            _preregisteredVisitors.isNotEmpty ? occurrencesList : Container(),
          ])
        ]));
  }
}
