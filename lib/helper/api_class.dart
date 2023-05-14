import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api {
  // get methode
  Future<dynamic> get({required String url}) async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'there is an error with status code ${response.statusCode}');
    }
  } // end of get method

  // post method
  Future<dynamic> post(
      {required String url,
      @required dynamic body,
      @required String? taken}) async {
    Map<String, String> headers = {};
    if (taken != null) {
      headers.addAll({'Authorization': 'Bearer $taken'});
    }
    http.Response response =
        await http.post(Uri.parse(url), body: body, headers: headers);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'there is an erro with status code ${response.statusCode} with body ${jsonDecode(response.body)}');
    }
  } // end of post method

  // put method
  Future<dynamic> put(
      {required String url,
      @required dynamic body,
      @required String? taken}) async {
    Map<String, String> headers = {};
    headers.addAll({'Content-Type': 'application/x-www-form-urlencoded'});
    if (taken != null) {
      headers.addAll({'Authorization': 'Bearer $taken'});
    }
    http.Response response =
        await http.put(Uri.parse(url), body: body, headers: headers);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return throw Exception(
          'there is an error with status code ${response.statusCode} with body ${jsonDecode(response.body)}');
    }
  } // end of put method
}
