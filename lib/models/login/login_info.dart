import 'dart:convert';

LoginInfo loginResponseFromJson(String str) => LoginInfo.fromJson(json.decode(str));

String loginResponseToJson(LoginInfo data) => json.encode(data.toJson());

class LoginInfo {
  LoginInfo({
    this.token,
    this.expireAt,
    this.user,
  });

  String token;
  DateTime expireAt;
  User user;

  factory LoginInfo.fromJson(Map<String, dynamic> json) => LoginInfo(
    token: json["token"],
    expireAt: DateTime.parse(json["expireAt"]),
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "expireAt": expireAt.toIso8601String(),
    "user": user.toJson(),
  };
}

class User {
  User({
    this.id,
    this.name,
    this.title,
    this.email,
    this.phone,
    this.jobDescription,
    this.isSystemOwner,
  });

  int id;
  String name;
  String title;
  String email;
  String phone;
  String jobDescription;
  bool isSystemOwner;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    title: json["title"],
    email: json["email"],
    phone: json["phone"],
    jobDescription: json["jobDescription"],
    isSystemOwner: json["isSystemOwner"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "title": title,
    "email": email,
    "phone": phone,
    "jobDescription": jobDescription,
    "isSystemOwner": isSystemOwner,
  };
}
