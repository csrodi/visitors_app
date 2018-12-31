import 'dart:async';
import 'dart:convert';

import 'package:visitors_app/entity/visit.dart';
import 'package:visitors_app/entity/visitor.dart';
import 'package:visitors_app/http_service.dart' as http;

class VisitService {
  Future<Visit> fetch(final int id) async {
    final response = await http.get('$id');

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON
      Map visitMap = json.decode(response.body);
      return Visit.fromJson(visitMap);
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load visitor');
    }
  }

  Future<Visit> signIn(final Visit visit) async {
    final response = await http.post('signIn', visit);

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON
      Map visitMap = json.decode(response.body);
      return Visit.fromJson(visitMap);
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load visitor');
    }
  }

  Future<Visit> signOut(final Visit visit) async {
    final response = await http.post('signOut', visit);

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON
      Map visitMap = json.decode(response.body);
      return Visit.fromJson(visitMap);
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load visitor');
    }
  }

  Future<Iterable<Visitor>> getRegisteredVisitors() async {
    final response = await http.get('registeredVisitors');

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON
      Iterable list = json.decode(response.body);
      return list.map((model) => Visitor.fromJson(model)).toList();
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load visitor');
    }
  }
}
