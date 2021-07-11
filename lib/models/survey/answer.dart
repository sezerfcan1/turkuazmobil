// To parse this JSON data, do
//
//     final answer = answerFromJson(jsonString);

import 'dart:convert';

Answer answerFromJson(String str) => Answer.fromJson(json.decode(str));

String answerToJson(Answer data) => json.encode(data.toJson());

class Answer {
  Answer({
    this.surveyId,
    this.choices,
    this.creationAt,
  });

  int surveyId;
  List<Choice> choices;
  DateTime creationAt;

  factory Answer.fromJson(Map<String, dynamic> json) => Answer(
    surveyId: json["surveyId"] == null ? null : json["surveyId"],
    choices: json["choices"] == null ? null : List<Choice>.from(json["choices"].map((x) => Choice.fromJson(x))),
    creationAt: json["creationAt"] == null ? null : DateTime.parse(json["creationAt"]),
  );

  Map<String, dynamic> toJson() => {
    "surveyId": surveyId == null ? null : surveyId,
    "choices": choices == null ? null : List<dynamic>.from(choices.map((x) => x.toJson())),
    "creationAt": creationAt == null ? null : creationAt.toIso8601String(),
  };
}

class Choice {
  Choice({
    this.surveyImageId,
    this.boxes,
  });

  int surveyImageId;
  List<Box> boxes;

  factory Choice.fromJson(Map<String, dynamic> json) => Choice(
    surveyImageId: json["surveyImageId"] == null ? null : json["surveyImageId"],
    boxes: json["boxes"] == null ? null : List<Box>.from(json["boxes"].map((x) => Box.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "surveyImageId": surveyImageId == null ? null : surveyImageId,
    "boxes": boxes == null ? null : List<dynamic>.from(boxes.map((x) => x.toJson())),
  };
}

class Box {
  Box({
    this.choiceId,
    this.startX,
    this.startY,
    this.width,
    this.height,
  });

  int choiceId;
  int startX;
  int startY;
  int width;
  int height;

  factory Box.fromJson(Map<String, dynamic> json) => Box(
    choiceId: json["choiceId"] == null ? null : json["choiceId"],
    startX: json["startX"] == null ? null : json["startX"],
    startY: json["startY"] == null ? null : json["startY"],
    width: json["width"] == null ? null : json["width"],
    height: json["height"] == null ? null : json["height"],
  );

  Map<String, dynamic> toJson() => {
    "choiceId": choiceId == null ? null : choiceId,
    "startX": startX == null ? null : startX,
    "startY": startY == null ? null : startY,
    "width": width == null ? null : width,
    "height": height == null ? null : height,
  };
}
