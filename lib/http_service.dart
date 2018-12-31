import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:visitors_app/context.dart';

Future<http.Response> get(String service) {
  return http.get('${Context.BASE_URL}/$service', headers: {HttpHeaders.authorizationHeader: Context.authToken});
}

Future<http.Response> post(String service, Object obj) {
  return http.post('${Context.BASE_URL}/$service', headers: {HttpHeaders.authorizationHeader: Context.authToken}, body: json.encode(obj));
}
