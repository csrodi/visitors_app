import 'package:flutter/material.dart';
import 'package:visitors_app/business/event_service.dart';
import 'package:visitors_app/business/login_service.dart';
import 'package:visitors_app/entity/event.dart';
import 'package:visitors_app/pages/sign_in.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _eventService = new EventService();
  final _loginService = new LoginService();

  List<Event> _currentEvents = new List();
  Event _selectedEvent;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _loadCurrentEvents());
  }

  void _loadCurrentEvents() {
    _eventService.getCurrentEvents().then((l) => setState(() {
          _currentEvents.addAll(l);
        }));
  }

  @override
  Widget build(BuildContext context) {
    Widget eventSection = DropdownButton<Event>(
      value: _selectedEvent,
      items: _currentEvents.map((Event e) => new DropdownMenuItem(value: e, child: Text(e.title))).toList(),
      onChanged: (value) {
        setState(() {
          _selectedEvent = value;
        });
      },
    );

    Widget videoSection = Row(
      children: [
        Expanded(
            child: Container(
          margin: const EdgeInsets.all(10.0),
          child: Center(
            child: Image(image: AssetImage('assets/graphics/splash_screen.png')),
          ),
        )),
      ],
    );

    Widget buttonSection = Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        margin: const EdgeInsets.all(10.0),
        child: FlatButton(
          textColor: Colors.white,
          color: Colors.blue,
          child: const Text('Sign In', semanticsLabel: 'Sign In'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SignInPage(event: _selectedEvent),
              ),
            );
          },
        ),
      ),
      Container(
        margin: const EdgeInsets.all(4.0),
        child: FlatButton(
          textColor: Colors.white,
          color: Colors.blue,
          child: const Text('Sign Out', semanticsLabel: 'Sign Out'),
          onPressed: () {
            Navigator.pushNamed(context, '/signout');
          },
        ),
      ),
    ]);

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Welcome Page'),
        actions: <Widget>[
          // action button
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              _loginService.logout().whenComplete(() => Navigator.of(context).pushReplacementNamed("/login"));
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
        child: ListView(
          children: [
            // FIXME ListTile(title: eventSection),
            videoSection,
            buttonSection,
          ],
        ),
      ),
    );
  }
}
