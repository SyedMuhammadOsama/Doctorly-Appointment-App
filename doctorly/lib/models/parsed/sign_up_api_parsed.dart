class SignUpApiParsed {
  int? id;
  String? name;
  String? email;
  String? registeredAt;
  bool? confirmed;
  String? dob;
  String? gender;
  String? role;

  SignUpApiParsed(
      {this.id,
      this.name,
      this.email,
      this.registeredAt,
      this.confirmed,
      this.dob,
      this.gender,
      this.role});

  SignUpApiParsed.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    registeredAt = json['registered_at'];
    confirmed = json['confirmed'];
    dob = json['dob'];
    gender = json['gender'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['registered_at'] = this.registeredAt;
    data['confirmed'] = this.confirmed;
    data['dob'] = this.dob;
    data['gender'] = this.gender;
    data['role'] = this.role;
    return data;
  }
}
