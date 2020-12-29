class User {
  int id;
  String last_name;
  String first_name;
  String email;
  String password;
  String phone;
  String role;
  String flaglogged;

  User(
      {this.id,
      this.first_name,
      this.last_name,
      this.email,
      this.password,
      this.phone,
      this.role,
      this.flaglogged});

  User.map(dynamic obj) {
    this.id = obj['id'];
    this.email = obj['eamil'];
    this.first_name = obj['first_name'];
    this.last_name = obj['last_name'];
    this.password = obj['password'];
    this.phone = obj['phone'];
    this.role = obj['role'];
    this.flaglogged = obj['password'];
  }

  // int get id => id;
  // String get first_name => first_name;
  // String get last_name => last_name;
  // String get email => email;
  // String get password => password;
  // String get phone => phone;
  // String get role => role;
  // String get flaglogged => flaglogged;

  factory User.fromJson(dynamic data) {
    return User(
      id: data['id'],
      first_name: data['first_name'],
      last_name: data['last_name'],
      email: data['email'],
      phone: data['phone'],
      role: data['role'],
      password: data['password'],
      flaglogged: data['password'],
    );
  }
}

// _id: { type: Number, unique: true },
// first_name: { type: String, min: 4, max: 25, required: true, trim: true },
// last_name: { type: String, min: 4, max: 25, required: true, trim: true },
// email: { type: String, required: true, trim: true, unique: true },
// password: { type: String, required: true },
// phone: { type: String, required: true, trim: true },
// role: { type: String, required: true, trim: true },
