class RegPatientApiParsed {
  int? id;
  String? name;
  int? age;
  String? gender;
  String? symptoms;
  User? user;

  RegPatientApiParsed(
      {this.id, this.name, this.age, this.gender, this.symptoms, this.user});

  RegPatientApiParsed.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    age = json['age'];
    gender = json['gender'];
    symptoms = json['symptoms'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['age'] = age;
    data['gender'] = gender;
    data['symptoms'] = symptoms;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? password;
  String? registeredAt;
  bool? confirmed;
  String? role;

  User(
      {this.id,
      this.name,
      this.email,
      this.password,
      this.registeredAt,
      this.confirmed,
      this.role});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    registeredAt = json['registered_at'];
    confirmed = json['confirmed'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['registered_at'] = registeredAt;
    data['confirmed'] = confirmed;
    data['role'] = role;
    return data;
  }
}
