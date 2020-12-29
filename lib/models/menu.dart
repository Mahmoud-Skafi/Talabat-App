class Menu {
  int id;
  int res_id;
  int price;
  int rating;
  String name;
  String descr;
  String image;

  Menu({
    this.id,
    this.res_id,
    this.name,
    this.descr,
    this.price,
    this.image,
    this.rating,
  });

  Menu.map(dynamic obj) {
    this.id = obj['id'];
    this.res_id = obj['res_id'];
    this.name = obj['name'];
    this.descr = obj['descr'];
    this.price = obj['price'];
    this.image = obj['image'];
    this.rating = obj['rating'];
  }

  factory Menu.fromJson(dynamic data) {
    return Menu(
      id: data['id'],
      res_id: data['res_id'],
      name: data['name'],
      descr: data['customer_id'],
      price: data['price'],
      image: data['image'],
      rating: data['rating'],
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
