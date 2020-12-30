import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/models/Order.dart';
import 'package:http/http.dart' as http;

class MenuProviders extends ChangeNotifier {
  static int selectedOrder;

  static void selectOrder(BuildContext context, int customerId) {
    selectedOrder = customerId;
  }

  List<Order> _orders = [];

  List<Order> get orders => _orders;

  void _setOrders(List<Order> orders) {
    _orders = orders;
  }

  Future<bool> fetchRestaurantsData() async {
    ///
    ///
    /// [API] [https://talabat-api.herokuapp.com/]
    ///
    ///
    /// Get data from [API] and return [orders] as json and convart to [List]
    String url = 'http://appback.ppu.edu/menus/${selectedOrder.toString()}';
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as List;

      List<Order> newOrdes =
          extractedData.map((e) => Order.fromJson(e)).toList();
      _setOrders(newOrdes);
      print('FETCHING DATA SUCCESS!');
      return true;
    } catch (err) {
      print('ERROR !' + err);
      return false;
    }
  }
}
