class Restaurant {
  int id;
  String name;
  String city;
  String desc;
  String street;
  String lat;
  String long;
  String phone;
  String image;
  int rating;

  Restaurant(
      {this.id,
      this.name,
      this.city,
      this.desc,
      this.street,
      this.lat,
      this.long,
      this.phone,
      this.image,
      this.rating});

  Restaurant.map(dynamic obj) {
    this.id = obj['id'];
    this.name = obj['name'];
    this.city = obj['city'];
    this.desc = obj['desc'];
    this.street = obj['street'];
    this.lat = obj['lat'];
    this.long = obj['long'];
    this.phone = obj['phone'];
    this.image = obj['image'];
    this.rating = obj['rating'];
  }

  factory Restaurant.fromJson(dynamic data) {
    return Restaurant(
      id: data['id'],
      name: data['name'],
      city: data['city'],
      desc: data['desc'],
      street: data['street'],
      lat: data['lat'],
      long: data['long'],
      phone: data['phone'],
      image: data['image'],
      rating: data['rating'],
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
