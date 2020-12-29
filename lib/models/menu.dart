class Order {
  int _id;
  int _resID;
  int _menuID;
  int _customerID;
  int _quantity;
  String _address;
  String _phone;
  String _orderDate;

  Order(this._id, this._resID, this._menuID, this._customerID, this._quantity,
      this._address, this._phone, this._orderDate);

  Order.map(dynamic obj) {
    this._id = obj['id'];
    this._resID = obj['res_id'];
    this._menuID = obj['menu_id'];
    this._customerID = obj['coustomer_id'];
    this._quantity = obj['quantity'];
    this._address = obj['address'];

    this._phone = obj['phone'];
    this._orderDate = obj['order_date'];
  }

  int get id => _id;
  int get name => _resID;
  int get city => _menuID;
  int get desc => _customerID;
  int get street => _quantity;
  String get lat => _address;

  String get phone => _phone;
  String get image => _orderDate;

  factory Order.fromJson(Map<String, dynamic> data) {
    return Order(
      data['id'],
      data['res_id'],
      data['menu_id'],
      data['customer_id'],
      data['quantity'],
      data['address'],
      data['phone'],
      data['order_date'],
    );
  }
}
