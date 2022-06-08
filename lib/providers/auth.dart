import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  String? _token;
  DateTime? _expiryDate;
  String? _userId;

  Future<void> authenticate(
      String? email, String? password, String urlSegment) async {
    var url = Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:$urlSegment?key=AIzaSyBUIC3UhUs0kBPKrxxJucLitnLugYVUBQk');
    final response = await http.post(url,
        body: json.encode({
          'email': email,
          'password': password,
          'returnSecureToken': true,
        }));
    print(json.decode(response.body));
  }

  Future<void> signup(String? email, String? password) async {
    return authenticate(email, password, 'signUp');
  }

  Future<void> login(String? email, String? password) async {
    return authenticate(email, password, 'signInWithPassword');
  }
}
