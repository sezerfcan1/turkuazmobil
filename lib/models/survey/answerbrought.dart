// To parse this JSON data, do
//
//     final answerBrought = answerBroughtFromJson(jsonString);

import 'dart:convert';

AnswerBrought answerBroughtFromJson(String str) => AnswerBrought.fromJson(json.decode(str));

String answerBroughtToJson(AnswerBrought data) => json.encode(data.toJson());

class AnswerBrought {
  AnswerBrought({
    this.doctorId,
    this.doctor,
    this.surveyId,
    this.survey,
    this.choices,
    this.creationAt,
    this.concurrencyToken,
    this.id,
  });

  int doctorId;
  Doctor doctor;
  int surveyId;
  Survey survey;
  List<ChoiceElement> choices;
  DateTime creationAt;
  int concurrencyToken;
  int id;

  factory AnswerBrought.fromJson(Map<String, dynamic> json) => AnswerBrought(
    doctorId: json["doctorId"] == null ? null : json["doctorId"],
    doctor: json["doctor"] == null ? null : Doctor.fromJson(json["doctor"]),
    surveyId: json["surveyId"] == null ? null : json["surveyId"],
    survey: json["survey"] == null ? null : Survey.fromJson(json["survey"]),
    choices: json["choices"] == null ? null : List<ChoiceElement>.from(json["choices"].map((x) => ChoiceElement.fromJson(x))),
    creationAt: json["creationAt"] == null ? null : DateTime.parse(json["creationAt"]),
    concurrencyToken: json["concurrencyToken"] == null ? null : json["concurrencyToken"],
    id: json["id"] == null ? null : json["id"],
  );

  Map<String, dynamic> toJson() => {
    "doctorId": doctorId == null ? null : doctorId,
    "doctor": doctor == null ? null : doctor.toJson(),
    "surveyId": surveyId == null ? null : surveyId,
    "survey": survey == null ? null : survey.toJson(),
    "choices": choices == null ? null : List<dynamic>.from(choices.map((x) => x.toJson())),
    "creationAt": creationAt == null ? null : creationAt.toIso8601String(),
    "concurrencyToken": concurrencyToken == null ? null : concurrencyToken,
    "id": id == null ? null : id,
  };
}

class ChoiceElement {
  ChoiceElement({
    this.surveyImageId,
    this.surveyImage,
    this.boxes,
    this.concurrencyToken,
    this.id,
  });

  int surveyImageId;
  SurveyImage surveyImage;
  List<Box> boxes;
  int concurrencyToken;
  int id;

  factory ChoiceElement.fromJson(Map<String, dynamic> json) => ChoiceElement(
    surveyImageId: json["surveyImageId"] == null ? null : json["surveyImageId"],
    surveyImage: json["surveyImage"] == null ? null : SurveyImage.fromJson(json["surveyImage"]),
    boxes: json["boxes"] == null ? null : List<Box>.from(json["boxes"].map((x) => Box.fromJson(x))),
    concurrencyToken: json["concurrencyToken"] == null ? null : json["concurrencyToken"],
    id: json["id"] == null ? null : json["id"],
  );

  Map<String, dynamic> toJson() => {
    "surveyImageId": surveyImageId == null ? null : surveyImageId,
    "surveyImage": surveyImage == null ? null : surveyImage.toJson(),
    "boxes": boxes == null ? null : List<dynamic>.from(boxes.map((x) => x.toJson())),
    "concurrencyToken": concurrencyToken == null ? null : concurrencyToken,
    "id": id == null ? null : id,
  };
}

class Box {
  Box({
    this.choiceId,
    this.choice,
    this.startX,
    this.startY,
    this.width,
    this.height,
    this.concurrencyToken,
    this.id,
  });

  int choiceId;
  BoxChoice choice;
  int startX;
  int startY;
  int width;
  int height;
  int concurrencyToken;
  int id;

  factory Box.fromJson(Map<String, dynamic> json) => Box(
    choiceId: json["choiceId"] == null ? null : json["choiceId"],
    choice: json["choice"] == null ? null : BoxChoice.fromJson(json["choice"]),
    startX: json["startX"] == null ? null : json["startX"],
    startY: json["startY"] == null ? null : json["startY"],
    width: json["width"] == null ? null : json["width"],
    height: json["height"] == null ? null : json["height"],
    concurrencyToken: json["concurrencyToken"] == null ? null : json["concurrencyToken"],
    id: json["id"] == null ? null : json["id"],
  );

  Map<String, dynamic> toJson() => {
    "choiceId": choiceId == null ? null : choiceId,
    "choice": choice == null ? null : choice.toJson(),
    "startX": startX == null ? null : startX,
    "startY": startY == null ? null : startY,
    "width": width == null ? null : width,
    "height": height == null ? null : height,
    "concurrencyToken": concurrencyToken == null ? null : concurrencyToken,
    "id": id == null ? null : id,
  };
}

class BoxChoice {
  BoxChoice({
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

  factory BoxChoice.fromJson(Map<String, dynamic> json) => BoxChoice(
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

class SurveyImage {
  SurveyImage({
    this.id,
    this.size,
    this.path,
    this.hash,
    this.fileName,
  });

  int id;
  int size;
  dynamic path;
  String hash;
  String fileName;

  factory SurveyImage.fromJson(Map<String, dynamic> json) => SurveyImage(
    id: json["id"] == null ? null : json["id"],
    size: json["size"] == null ? null : json["size"],
    path: json["path"],
    hash: json["hash"] == null ? null : json["hash"],
    fileName: json["fileName"] == null ? null : json["fileName"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "size": size == null ? null : size,
    "path": path,
    "hash": hash == null ? null : hash,
    "fileName": fileName == null ? null : fileName,
  };
}

class Doctor {
  Doctor({
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
    this.concurrencyToken,
    this.id,
  });

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
  dynamic image;
  dynamic password;
  String about;
  int activityPercent;
  int concurrencyToken;
  int id;

  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
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
    image: json["image"],
    password: json["password"],
    about: json["about"] == null ? null : json["about"],
    activityPercent: json["activityPercent"] == null ? null : json["activityPercent"],
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
    "hospital": hospital == null ? null : hospital,
    "department": department == null ? null : department,
    "type": type == null ? null : type,
    "gender": gender == null ? null : gender,
    "isConfirmed": isConfirmed == null ? null : isConfirmed,
    "creationAt": creationAt == null ? null : creationAt.toIso8601String(),
    "dateOfBirth": dateOfBirth == null ? null : dateOfBirth.toIso8601String(),
    "image": image,
    "password": password,
    "about": about == null ? null : about,
    "activityPercent": activityPercent == null ? null : activityPercent,
    "concurrencyToken": concurrencyToken == null ? null : concurrencyToken,
    "id": id == null ? null : id,
  };
}

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
  dynamic administrator;
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
  dynamic choiceGroup;
  List<dynamic> images;
  List<dynamic> smallImages;
  int concurrencyToken;
  int id;

  factory Survey.fromJson(Map<String, dynamic> json) => Survey(
    createdBy: json["createdBy"] == null ? null : json["createdBy"],
    administrator: json["administrator"],
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
    choiceGroup: json["choiceGroup"],
    images: json["images"] == null ? null : List<dynamic>.from(json["images"].map((x) => x)),
    smallImages: json["smallImages"] == null ? null : List<dynamic>.from(json["smallImages"].map((x) => x)),
    concurrencyToken: json["concurrencyToken"] == null ? null : json["concurrencyToken"],
    id: json["id"] == null ? null : json["id"],
  );

  Map<String, dynamic> toJson() => {
    "createdBy": createdBy == null ? null : createdBy,
    "administrator": administrator,
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
    "choiceGroup": choiceGroup,
    "images": images == null ? null : List<dynamic>.from(images.map((x) => x)),
    "smallImages": smallImages == null ? null : List<dynamic>.from(smallImages.map((x) => x)),
    "concurrencyToken": concurrencyToken == null ? null : concurrencyToken,
    "id": id == null ? null : id,
  };
}
