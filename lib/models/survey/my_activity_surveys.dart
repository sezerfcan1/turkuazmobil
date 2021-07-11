import 'dart:convert';

List<MyActivitySurveys> myActivitySurveysFromJson(String str) => List<MyActivitySurveys>.from(json.decode(str).map((x) => MyActivitySurveys.fromJson(x)));

String myActivitySurveysToJson(List<MyActivitySurveys> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyActivitySurveys {
  MyActivitySurveys({
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
  dynamic doctor;
  int surveyId;
  Survey survey;
  List<dynamic> choices;
  DateTime creationAt;
  int concurrencyToken;
  int id;

  factory MyActivitySurveys.fromJson(Map<String, dynamic> json) => MyActivitySurveys(
    doctorId: json["doctorId"] == null ? null : json["doctorId"],
    doctor: json["doctor"],
    surveyId: json["surveyId"] == null ? null : json["surveyId"],
    survey: json["survey"] == null ? null : Survey.fromJson(json["survey"]),
    choices: json["choices"] == null ? null : List<dynamic>.from(json["choices"].map((x) => x)),
    creationAt: json["creationAt"] == null ? null : DateTime.parse(json["creationAt"]),
    concurrencyToken: json["concurrencyToken"] == null ? null : json["concurrencyToken"],
    id: json["id"] == null ? null : json["id"],
  );

  Map<String, dynamic> toJson() => {
    "doctorId": doctorId == null ? null : doctorId,
    "doctor": doctor,
    "surveyId": surveyId == null ? null : surveyId,
    "survey": survey == null ? null : survey.toJson(),
    "choices": choices == null ? null : List<dynamic>.from(choices.map((x) => x)),
    "creationAt": creationAt == null ? null : creationAt.toIso8601String(),
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
  List<SmallImage> smallImages;
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
    smallImages: json["smallImages"] == null ? null : List<SmallImage>.from(json["smallImages"].map((x) => SmallImage.fromJson(x))),
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
    "smallImages": smallImages == null ? null : List<dynamic>.from(smallImages.map((x) => x.toJson())),
    "concurrencyToken": concurrencyToken == null ? null : concurrencyToken,
    "id": id == null ? null : id,
  };
}

class SmallImage {
  SmallImage({
    this.id,
    this.size,
    this.path,
    this.hash,
    this.fileName,
    this.surveyImageId,
  });

  int id;
  int size;
  dynamic path;
  String hash;
  String fileName;
  int surveyImageId;

  factory SmallImage.fromJson(Map<String, dynamic> json) => SmallImage(
    id: json["id"] == null ? null : json["id"],
    size: json["size"] == null ? null : json["size"],
    path: json["path"],
    hash: json["hash"] == null ? null : json["hash"],
    fileName: json["fileName"] == null ? null : json["fileName"],
    surveyImageId: json["surveyImageId"] == null ? null : json["surveyImageId"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "size": size == null ? null : size,
    "path": path,
    "hash": hash == null ? null : hash,
    "fileName": fileName == null ? null : fileName,
    "surveyImageId": surveyImageId == null ? null : surveyImageId,
  };
}
