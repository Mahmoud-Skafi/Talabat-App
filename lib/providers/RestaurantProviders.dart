import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/models/Restaurant.dart';
import 'package:http/http.dart' as http;

class MenuProviders extends ChangeNotifier {
  List<Restaurant> _res = [];

  List<Restaurant> get res => _res;

  void _setRestaurants(List<Restaurant> orders) {
    _res = orders;
  }

  Future<bool> fetchRestaurantsData() async {
    ///
    ///
    /// [API] [https://talabat-api.herokuapp.com/]
    ///
    ///
    /// Get data from [API] and return [Restaurant] as json and convart to [List]
    const url = 'https://talabat-api.herokuapp.com/res';
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as List;

      List<Restaurant> newOrdes =
          extractedData.map((e) => Restaurant.fromJson(e)).toList();
      _setRestaurants(newOrdes);
      print('FETCHING DATA SUCCESS!');
      return true;
    } catch (err) {
      print('ERROR !' + err);
      return false;
    }
  }
}
