class User {
  int _id;
  String _lastName;
  String _firstName;
  String _email;
  String _password;
  String _phone;
  String _role;
  String _flaglogged;

  User(this._id, this._firstName, this._lastName, this._email, this._password,
      this._phone, this._role, this._flaglogged);

  User.map(dynamic obj) {
    this._id = obj['id'];
    this._email = obj['eamil'];
    this._firstName = obj['first_name'];
    this._lastName = obj['last_name'];
    this._password = obj['password'];
    this._phone = obj['phone'];
    this._role = obj['role'];
    this._flaglogged = obj['password'];
  }

  int get id => _id;
  String get first_name => _firstName;
  String get last_name => _lastName;
  String get email => _email;
  String get password => _password;
  String get phone => _phone;
  String get role => _role;
  String get flaglogged => _flaglogged;

  factory User.fromJson(Map<String, dynamic> data) {
    return User(
      data['id'],
      data['first_name'],
      data['last_name'],
      data['email'],
      data['password'],
      data['phone'],
      data['role'],
      data['password'],
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
