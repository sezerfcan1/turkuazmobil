// To parse this JSON data, do
//
//     final survey = surveyFromJson(jsonString);

import 'dart:convert';

import 'dart:ui';

import 'package:turkuazmobil/edit/colored_point.dart';

Survey surveyFromJson(String str) => Survey.fromJson(json.decode(str));

String surveyToJson(Survey data) => json.encode(data.toJson());

class Survey {
  Survey({
    this.createdBy,
    this.administrator,
    this.status,
    this.title,
    this.body,
    this.creationAt,
    this.choiceGroupId,
    this.progressPercent,
    this.answerCount,
    this.automaticFinish,
    this.startAt,
    this.finishAt,
    this.choiceGroup,
    this.images,
    this.smallImages,
    this.concurrencyToken,
    this.id,
  });

  int createdBy;
  Administrator administrator;
  int status;
  String title;
  String body;
  DateTime creationAt;
  int choiceGroupId;
  int progressPercent;
  int answerCount;
  bool automaticFinish;
  dynamic startAt;
  dynamic finishAt;
  ChoiceGroup choiceGroup;
  List<Image> images;
  List<Image> smallImages;
  int concurrencyToken;
  int id;

  factory Survey.fromJson(Map<String, dynamic> json) => Survey(
    createdBy: json["createdBy"] == null ? null : json["createdBy"],
    administrator: json["administrator"] == null ? null : Administrator.fromJson(json["administrator"]),
    status: json["status"] == null ? null : json["status"],
    title: json["title"] == null ? null : json["title"],
    body: json["body"] == null ? null : json["body"],
    creationAt: json["creationAt"] == null ? null : DateTime.parse(json["creationAt"]),
    choiceGroupId: json["choiceGroupId"] == null ? null : json["choiceGroupId"],
    progressPercent: json["progressPercent"] == null ? null : json["progressPercent"],
    answerCount: json["answerCount"] == null ? null : json["answerCount"],
    automaticFinish: json["automaticFinish"] == null ? null : json["automaticFinish"],
    startAt: json["startAt"],
    finishAt: json["finishAt"],
    choiceGroup: json["choiceGroup"] == null ? null : ChoiceGroup.fromJson(json["choiceGroup"]),
    images: json["images"] == null ? null : List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
    smallImages: json["smallImages"] == null ? null : List<Image>.from(json["smallImages"].map((x) => Image.fromJson(x))),
    concurrencyToken: json["concurrencyToken"] == null ? null : json["concurrencyToken"],
    id: json["id"] == null ? null : json["id"],
  );

  Map<String, dynamic> toJson() => {
    "createdBy": createdBy == null ? null : createdBy,
    "administrator": administrator == null ? null : administrator.toJson(),
    "status": status == null ? null : status,
    "title": title == null ? null : title,
    "body": body == null ? null : body,
    "creationAt": creationAt == null ? null : creationAt.toIso8601String(),
    "choiceGroupId": choiceGroupId == null ? null : choiceGroupId,
    "progressPercent": progressPercent == null ? null : progressPercent,
    "answerCount": answerCount == null ? null : answerCount,
    "automaticFinish": automaticFinish == null ? null : automaticFinish,
    "startAt": startAt,
    "finishAt": finishAt,
    "choiceGroup": choiceGroup == null ? null : choiceGroup.toJson(),
    "images": images == null ? null : List<dynamic>.from(images.map((x) => x.toJson())),
    "smallImages": smallImages == null ? null : List<dynamic>.from(smallImages.map((x) => x.toJson())),
    "concurrencyToken": concurrencyToken == null ? null : concurrencyToken,
    "id": id == null ? null : id,
  };
}

class Administrator {
  Administrator({
    this.title,
    this.name,
    this.surname,
    this.fullName,
    this.email,
    this.phone,
    this.creationAt,
    this.password,
    this.about,
    this.systemOwner,
    this.gender,
    this.image,
    this.createdSurveys,
    this.profileDonePercent,
    this.concurrencyToken,
    this.id,
  });

  String title;
  String name;
  String surname;
  String fullName;
  String email;
  String phone;
  DateTime creationAt;
  dynamic password;
  String about;
  bool systemOwner;
  int gender;
  Image image;
  int createdSurveys;
  int profileDonePercent;
  int concurrencyToken;
  int id;

  factory Administrator.fromJson(Map<String, dynamic> json) => Administrator(
    title: json["title"] == null ? null : json["title"],
    name: json["name"] == null ? null : json["name"],
    surname: json["surname"] == null ? null : json["surname"],
    fullName: json["fullName"] == null ? null : json["fullName"],
    email: json["email"] == null ? null : json["email"],
    phone: json["phone"] == null ? null : json["phone"],
    creationAt: json["creationAt"] == null ? null : DateTime.parse(json["creationAt"]),
    password: json["password"],
    about: json["about"] == null ? null : json["about"],
    systemOwner: json["systemOwner"] == null ? null : json["systemOwner"],
    gender: json["gender"] == null ? null : json["gender"],
    image: json["image"] == null ? null : Image.fromJson(json["image"]),
    createdSurveys: json["createdSurveys"] == null ? null : json["createdSurveys"],
    profileDonePercent: json["profileDonePercent"] == null ? null : json["profileDonePercent"],
    concurrencyToken: json["concurrencyToken"] == null ? null : json["concurrencyToken"],
    id: json["id"] == null ? null : json["id"],
  );

  Map<String, dynamic> toJson() => {
    "title": title == null ? null : title,
    "name": name == null ? null : name,
    "surname": surname == null ? null : surname,
    "fullName": fullName == null ? null : fullName,
    "email": email == null ? null : email,
    "phone": phone == null ? null : phone,
    "creationAt": creationAt == null ? null : creationAt.toIso8601String(),
    "password": password,
    "about": about == null ? null : about,
    "systemOwner": systemOwner == null ? null : systemOwner,
    "gender": gender == null ? null : gender,
    "image": image == null ? null : image.toJson(),
    "createdSurveys": createdSurveys == null ? null : createdSurveys,
    "profileDonePercent": profileDonePercent == null ? null : profileDonePercent,
    "concurrencyToken": concurrencyToken == null ? null : concurrencyToken,
    "id": id == null ? null : id,
  };
}

class Image {
  Image({
    this.size,
    this.path,
    this.hash,
    this.fileName,
    this.id,
    this.surveyImageId,
    this.cp,
  });

  int size;
  dynamic path;
  String hash;
  String fileName;
  int id;
  int surveyImageId;
  ColoredPoint cp;
  factory Image.fromJson(Map<String, dynamic> json) => Image(
    size: json["size"] == null ? null : json["size"],
    path: json["path"],
    hash: json["hash"] == null ? null : json["hash"],
    fileName: json["fileName"] == null ? null : json["fileName"],
    id: json["id"] == null ? null : json["id"],
    surveyImageId: json["surveyImageId"] == null ? null : json["surveyImageId"],
  );

  Map<String, dynamic> toJson() => {
    "size": size == null ? null : size,
    "path": path,
    "hash": hash == null ? null : hash,
    "fileName": fileName == null ? null : fileName,
    "id": id == null ? null : id,
    "surveyImageId": surveyImageId == null ? null : surveyImageId,
  };
}

class ChoiceGroup {
  ChoiceGroup({
    this.name,
    this.code,
    this.choiceCount,
    this.surveyCount,
    this.description,
    this.choiceGroupDefault,
    this.choices,
    this.concurrencyToken,
    this.id,
  });

  String name;
  String code;
  int choiceCount;
  int surveyCount;
  dynamic description;
  bool choiceGroupDefault;
  List<Choice> choices;
  int concurrencyToken;
  int id;

  factory ChoiceGroup.fromJson(Map<String, dynamic> json) => ChoiceGroup(
    name: json["name"] == null ? null : json["name"],
    code: json["code"] == null ? null : json["code"],
    choiceCount: json["choiceCount"] == null ? null : json["choiceCount"],
    surveyCount: json["surveyCount"] == null ? null : json["surveyCount"],
    description: json["description"],
    choiceGroupDefault: json["default"] == null ? null : json["default"],
    choices: json["choices"] == null ? null : List<Choice>.from(json["choices"].map((x) => Choice.fromJson(x))),
    concurrencyToken: json["concurrencyToken"] == null ? null : json["concurrencyToken"],
    id: json["id"] == null ? null : json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
    "code": code == null ? null : code,
    "choiceCount": choiceCount == null ? null : choiceCount,
    "surveyCount": surveyCount == null ? null : surveyCount,
    "description": description,
    "default": choiceGroupDefault == null ? null : choiceGroupDefault,
    "choices": choices == null ? null : List<dynamic>.from(choices.map((x) => x.toJson())),
    "concurrencyToken": concurrencyToken == null ? null : concurrencyToken,
    "id": id == null ? null : id,
  };
}

class Choice {
  Choice({
    this.name,
    this.code,
    this.number,
    this.color,
    this.description,
    this.concurrencyToken,
    this.id,
  });

  String name;
  String code;
  int number;
  String color;
  dynamic description;
  int concurrencyToken;
  int id;
  Color getColor(){
    Color selectedColor  = Color(int.parse(color.replaceAll('#', '0xFF')));
    return selectedColor;
  }

  factory Choice.fromJson(Map<String, dynamic> json) => Choice(
    name: json["name"] == null ? null : json["name"],
    code: json["code"] == null ? null : json["code"],
    number: json["number"] == null ? null : json["number"],
    color: json["color"] == null ? null : json["color"],
    description: json["description"],
    concurrencyToken: json["concurrencyToken"] == null ? null : json["concurrencyToken"],
    id: json["id"] == null ? null : json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
    "code": code == null ? null : code,
    "number": number == null ? null : number,
    "color": color == null ? null : color,
    "description": description,
    "concurrencyToken": concurrencyToken == null ? null : concurrencyToken,
    "id": id == null ? null : id,
  };
}
