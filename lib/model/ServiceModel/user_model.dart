class UserModel {
  String? userId, email, name, picture,phone;

  UserModel({this.userId, this.email, this.name, this.picture, this.phone});

  UserModel.fromJson(Map<dynamic, dynamic> map) {
    if (Map==null) return;

    userId = map["userId"];
    email = map["email"];
    name = map["name"];
    picture = map["picture"];
    phone= map['phone'];
  }

  toJson() {
    return {
      'userId': userId,
      'email': email,
      'name': name,
      'picture': picture,
      'phone': phone,
    };
  }
}