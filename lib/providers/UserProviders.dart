import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/models/User.dart';
import 'package:http/http.dart' as http;

class MenuProviders extends ChangeNotifier {
  List<User> _users = [];

  List<User> get users => _users;

  void _setUsers(List<User> users) {
    _users = users;
  }

  Future<bool> fetchRestaurantsData() async {
    ///
    ///
    /// [API] [https://talabat-api.herokuapp.com/]
    ///
    ///
    /// Get data from [API] and return [user] as json and convart to [List]
    const url = 'http://appback.ppu.edu/restaurants';
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as List;

      List<User> newUsers = extractedData.map((e) => User.fromJson(e)).toList();
      _setUsers(newUsers);
      print('FETCHING DATA SUCCESS!');
      return true;
    } catch (err) {
      print('ERROR !' + err);
      return false;
    }
  }
}
