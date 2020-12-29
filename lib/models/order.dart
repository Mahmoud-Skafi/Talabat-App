class Order {
  int id;
  int res_id;
  int menu_id;
  int coustomer_id;
  int quantity;
  String address;
  String phone;
  String order_date;

  Order(
      {this.id,
      this.res_id,
      this.menu_id,
      this.coustomer_id,
      this.quantity,
      this.address,
      this.phone,
      this.order_date});

  Order.map(dynamic obj) {
    this.id = obj['id'];
    this.res_id = obj['res_id'];
    this.menu_id = obj['menu_id'];
    this.coustomer_id = obj['coustomer_id'];
    this.quantity = obj['quantity'];
    this.address = obj['address'];

    this.phone = obj['phone'];
    this.order_date = obj['order_date'];
  }

  factory Order.fromJson(dynamic data) {
    return Order(
      id: data['id'],
      res_id: data['res_id'],
      menu_id: data['menu_id'],
      coustomer_id: data['customer_id'],
      quantity: data['quantity'],
      address: data['address'],
      phone: data['phone'],
      order_date: data['order_date'],
    );
  }
}

// _id: { type: Number, required: true },
// res_id: { type: Number, required: true, unique: false },
// menu_id: { type: Number, required: true, unique: false },
// customer_id: { type: Number, required: true, unique: false },
// quantity: { type: Number, required: true },
// address: { type: String, required: true, trim: true },
// phone: { type: String, required: true, trim: true },
// order_date: { type: Date, required: true, default: Date.now() }
