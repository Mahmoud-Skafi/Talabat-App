class Menu {
  int _id;
  int _resID;
  int _price;
  int _rating;
  String _name;
  String _descr;
  String _image;

  Menu(
    this._id,
    this._resID,
    this._name,
    this._descr,
    this._price,
    this._image,
    this._rating,
  );

  Menu.map(dynamic obj) {
    this._id = obj['id'];
    this._resID = obj['res_id'];
    this._name = obj['name'];
    this._descr = obj['descr'];
    this._price = obj['price'];
    this._image = obj['image'];
    this._rating = obj['rating'];
  }

  int get id => _id;
  int get res_id => _resID;
  String get name => _name;
  String get descr => _descr;
  int get price => _price;
  String get image => image;

  int get rating => _rating;

  factory Menu.fromJson(Map<String, dynamic> data) {
    return Menu(
      data['id'],
      data['res_id'],
      data['name'],
      data['customer_id'],
      data['price'],
      data['image'],
      data['rating'],
    );
  }
}
// _id: { type: Number, required: true },
// res_id: { type: Number, required: true, unique: false },
// name: { type: String, min: 4, max: 50, required: true, trim: true },
// descrr: { type: String },
// price: { type: Number, required: true },
// image: { type: String },
// rating: { type: Number, max: 10 }
