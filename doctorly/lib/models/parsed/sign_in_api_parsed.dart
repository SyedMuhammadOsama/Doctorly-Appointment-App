class SignInApiParsed {
  String? token;

  SignInApiParsed({this.token});

  SignInApiParsed.fromJson(Map<String, dynamic> json) {
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['token'] = token;
    return data;
  }
}
