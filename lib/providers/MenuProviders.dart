import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/models/Menu.dart';
import 'package:http/http.dart' as http;

class MenuProviders extends ChangeNotifier {
  List<Menu> _menus = [];

  List<Menu> get menus => _menus;

  void _setMenus(List<Menu> menus) {
    _menus = menus;
  }

  Future<bool> fetchRestaurantsData() async {
    const url = 'http://appback.ppu.edu/restaurants';
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
