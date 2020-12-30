import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/models/Menu.dart';
import 'package:http/http.dart' as http;

class MenuProviders extends ChangeNotifier {
  static int selectedRestaurant;

  static void selectRestaurant(BuildContext context, int resId) {
    selectedRestaurant = resId;
  }

  List<Menu> _menus = [];

  List<Menu> get menus => _menus;

  void _setMenus(List<Menu> menus) {
    _menus = menus;
  }

  Future<bool> fetchMenuData() async {
    ///
    ///
    /// [API] [https://talabat-api.herokuapp.com/]
    ///
    ///
    /// Get data from [API] and return [menus] as json and convart to [List]
    String url =
        'https://talabat-api.herokuapp.com/order/${selectedRestaurant.toString()}';
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as List;

      List<Menu> newMenus = extractedData.map((e) => Menu.fromJson(e)).toList();
      _setMenus(newMenus);
      print('FETCHING DATA SUCCESS!');
      return true;
    } catch (err) {
      print('ERROR !' + err);
      return false;
    }
  }
}
