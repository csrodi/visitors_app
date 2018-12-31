import 'dart:async';
import 'dart:convert';

import 'package:visitors_app/entity/event.dart';
import 'package:visitors_app/http_service.dart' as http;

class EventService {
  Future<Iterable<Event>> getCurrentEvents() async {
    final response = await http.get('currentEvents');

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON
      Iterable list = json.decode(response.body);
      return list.map((model) => Event.fromJson(model)).toList();
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load events');
    }
  }
}
