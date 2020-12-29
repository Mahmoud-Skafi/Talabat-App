class Restaurant {
  int _id;
  String _name;
  String _city;
  String _desc;
  String _street;
  String _lat;
  String _long;
  String _phone;
  String _image;
  int _rating;

  Restaurant(this._id, this._name, this._city, this._desc, this._street,
      this._lat, this._long, this._phone, this._image, this._rating);

  Restaurant.map(dynamic obj) {
    this._id = obj['id'];
    this._name = obj['name'];
    this._city = obj['city'];
    this._desc = obj['desc'];
    this._street = obj['street'];
    this._lat = obj['lat'];
    this._long = obj['long'];
    this._phone = obj['phone'];
    this._image = obj['image'];
    this._rating = obj['rating'];
  }

  int get id => _id;
  String get name => _name;
  String get city => _city;
  String get desc => _desc;
  String get street => _street;
  String get lat => _lat;
  String get long => _long;
  String get phone => _phone;
  String get image => _image;
  int get rating => _rating;

  factory Restaurant.fromJson(Map<String, dynamic> data) {
    return Restaurant(
      data['id'],
      data['name'],
      data['city'],
      data['desc'],
      data['street'],
      data['lat'],
      data['long'],
      data['phone'],
      data['image'],
      data['rating'],
    );
  }
}

// _id: { type: Number, index: true, auto: true },
// name: { type: String, min: 4, max: 40, required: true, trim: true },
// city: { type: String, required: true },
// desc: { type: String, trim: true },
// street: { type: String, required: true },
// lat: { type: String },
// long: { type: String },
// phone: { type: String },
// image: { type: String, required: true },
// rating: { type: Number, required: true, max: 10
