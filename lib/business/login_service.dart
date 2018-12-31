import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:visitors_app/context.dart';

class LoginService {
  Future<bool> login(String username, String password) async {
    final basicAuth = 'Basic ' + base64Encode(utf8.encode('$username:$password'));
    final response = await http.get('${Context.BASE_URL}/login', headers: {HttpHeaders.authorizationHeader: basicAuth});

    if (response.statusCode == 200) {
      // If server returns an OK response, save the authorization token
      Context.authToken = basicAuth;
      return true;
    } else {
      // If that response was not OK, throw an error.
      Context.authToken = null;
      return false;
    }
  }

  Future<bool> logout() async {
    Context.authToken = null;

    final response = await http.get('${Context.BASE_URL}/logout');
    if (response.statusCode == 200) {
      // If server returns an OK response
      return true;
    } else {
      // If that response was not OK, throw an error.
      return false;
    }
  }
}
