import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/models/Order.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

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

  Future<bool> fetchOrderData() async {
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

  static Future<List<dynamic>> getOrderList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<dynamic> orderList = [];
    return (prefs.getString("orderList") == "")
        ? orderList
        : orderList = jsonDecode(prefs.getString("orderList"));
  }

  static void removeFromOrderList(int menuItemId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<dynamic> orderList = [];

    // List is there,
    print("Got the prefs for orderList :" + prefs.getString("orderList"));
    if (prefs.getString("orderList") == "") {
      return;
    }
    orderList = jsonDecode(prefs.getString("orderList"));
    if (orderList.contains(menuItemId)) {
      print("Found item in list !");
      orderList.remove(menuItemId);
      String newJsonArray = jsonEncode(orderList);
      prefs.setString("orderList", newJsonArray);
      print("removed item from the list");
    }
  }

  static void addToOrderList(int menuItemId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<dynamic> orderList = [];

    if (!(prefs.containsKey("orderList")) ||
        (prefs.getString("orderList")) == "") {
      print("Created Prefs for orderList");
      prefs.setString("orderList", "[]");
      print("Value for prefs :" + prefs.getString("orderList"));
    } else {
      print("Got the prefs for orderList :" + prefs.getString("orderList"));
      orderList = jsonDecode(prefs.getString("orderList"));
      if (orderList.contains(menuItemId)) {
        //Already in the list
        print("Already in list !");
      } else {
        orderList.add(menuItemId);
        String newJsonArray = jsonEncode(orderList);
        prefs.setString("orderList", newJsonArray);
        print(newJsonArray);
      }
    }
  }
}
