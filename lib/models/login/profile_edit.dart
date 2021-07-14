// To parse this JSON data, do
//
//     final profileInfo = profileInfoFromJson(jsonString);

import 'dart:convert';

ProfileInfo profileInfoFromJson(String str) => ProfileInfo.fromJson(json.decode(str));

String profileInfoToJson(ProfileInfo data) => json.encode(data.toJson());

class ProfileInfo {
  ProfileInfo({
    this.name,
    this.surname,
    this.email,
    this.phone,
    this.hospital,
    this.department,
    this.isConfirmed,
    this.dateOfBirth,
    this.about,
    this.gender,
  });

  String name;
  String surname;
  String email;
  String phone;
  String hospital;
  String department;
  bool isConfirmed;
  DateTime dateOfBirth;
  String about;
  int gender;

  factory ProfileInfo.fromJson(Map<String, dynamic> json) => ProfileInfo(
    name: json["name"] == null ? null : json["name"],
    surname: json["surname"] == null ? null : json["surname"],
    email: json["email"] == null ? null : json["email"],
    phone: json["phone"] == null ? null : json["phone"],
    hospital: json["hospital"] == null ? null : json["hospital"],
    department: json["department"] == null ? null : json["department"],
    isConfirmed: json["isConfirmed"] == null ? null : json["isConfirmed"],
    dateOfBirth: json["dateOfBirth"] == null ? null : DateTime.parse(json["dateOfBirth"]),
    about: json["about"] == null ? null : json["about"],
    gender: json["gender"] == null ? null : json["gender"],
  );

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
    "surname": surname == null ? null : surname,
    "email": email == null ? null : email,
    "phone": phone == null ? null : phone,
    "hospital": hospital == null ? null : hospital,
    "department": department == null ? null : department,
    "isConfirmed": isConfirmed == null ? null : isConfirmed,
    "dateOfBirth": dateOfBirth == null ? null : dateOfBirth.toIso8601String(),
    "about": about == null ? null : about,
    "gender": gender == null ? null : gender,
  };
}
