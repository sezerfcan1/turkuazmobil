// To parse this JSON data, do
//
//     final doctorMyInfo = doctorMyInfoFromJson(jsonString);

import 'dart:convert';

DoctorMyInfo doctorMyInfoFromJson(String str) => DoctorMyInfo.fromJson(json.decode(str));

String doctorMyInfoToJson(DoctorMyInfo data) => json.encode(data.toJson());

class DoctorMyInfo {
  DoctorMyInfo({
    this.id,
    this.concurrencyToken,
    this.title,
    this.name,
    this.surname,
    this.fullName,
    this.email,
    this.phone,
    this.hospital,
    this.department,
    this.type,
    this.gender,
    this.isConfirmed,
    this.creationAt,
    this.dateOfBirth,
    this.image,
    this.password,
    this.about,
    this.activityPercent,
  });

  int id;
  int concurrencyToken;
  String title;
  String name;
  String surname;
  String fullName;
  String email;
  String phone;
  String hospital;
  String department;
  int type;
  int gender;
  bool isConfirmed;
  DateTime creationAt;
  DateTime dateOfBirth;
  Image image;
  String password;
  String about;
  int activityPercent;

  factory DoctorMyInfo.fromJson(Map<String, dynamic> json) => DoctorMyInfo(
    id: json["id"] == null ? null : json["id"],
    concurrencyToken: json["concurrencyToken"] == null ? null : json["concurrencyToken"],
    title: json["title"] == null ? null : json["title"],
    name: json["name"] == null ? null : json["name"],
    surname: json["surname"] == null ? null : json["surname"],
    fullName: json["fullName"] == null ? null : json["fullName"],
    email: json["email"] == null ? null : json["email"],
    phone: json["phone"] == null ? null : json["phone"],
    hospital: json["hospital"] == null ? null : json["hospital"],
    department: json["department"] == null ? null : json["department"],
    type: json["type"] == null ? null : json["type"],
    gender: json["gender"] == null ? null : json["gender"],
    isConfirmed: json["isConfirmed"] == null ? null : json["isConfirmed"],
    creationAt: json["creationAt"] == null ? null : DateTime.parse(json["creationAt"]),
    dateOfBirth: json["dateOfBirth"] == null ? null : DateTime.parse(json["dateOfBirth"]),
    image: json["image"] == null ? null : Image.fromJson(json["image"]),
    password: json["password"] == null ? null : json["password"],
    about: json["about"] == null ? null : json["about"],
    activityPercent: json["activityPercent"] == null ? null : json["activityPercent"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "concurrencyToken": concurrencyToken == null ? null : concurrencyToken,
    "title": title == null ? null : title,
    "name": name == null ? null : name,
    "surname": surname == null ? null : surname,
    "fullName": fullName == null ? null : fullName,
    "email": email == null ? null : email,
    "phone": phone == null ? null : phone,
    "hospital": hospital == null ? null : hospital,
    "department": department == null ? null : department,
    "type": type == null ? null : type,
    "gender": gender == null ? null : gender,
    "isConfirmed": isConfirmed == null ? null : isConfirmed,
    "creationAt": creationAt == null ? null : creationAt.toIso8601String(),
    "dateOfBirth": dateOfBirth == null ? null : dateOfBirth.toIso8601String(),
    "image": image == null ? null : image.toJson(),
    "password": password == null ? null : password,
    "about": about == null ? null : about,
    "activityPercent": activityPercent == null ? null : activityPercent,
  };
}

class Image {
  Image({
    this.size,
    this.path,
    this.hash,
    this.fileName,
  });

  int size;
  String path;
  String hash;
  String fileName;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    size: json["size"] == null ? null : json["size"],
    path: json["path"] == null ? null : json["path"],
    hash: json["hash"] == null ? null : json["hash"],
    fileName: json["fileName"] == null ? null : json["fileName"],
  );

  Map<String, dynamic> toJson() => {
    "size": size == null ? null : size,
    "path": path == null ? null : path,
    "hash": hash == null ? null : hash,
    "fileName": fileName == null ? null : fileName,
  };
}
