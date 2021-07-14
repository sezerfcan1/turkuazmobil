
import 'dart:convert';

ModifyPassword modifyPasswordFromJson(String str) => ModifyPassword.fromJson(json.decode(str));

String modifyPasswordToJson(ModifyPassword data) => json.encode(data.toJson());

class ModifyPassword {
  ModifyPassword({
    this.current,
    this.change,
  });

  String current;
  String change;

  factory ModifyPassword.fromJson(Map<String, dynamic> json) => ModifyPassword(
    current: json["current"] == null ? null : json["current"],
    change: json["change"] == null ? null : json["change"],
  );

  Map<String, dynamic> toJson() => {
    "current": current == null ? null : current,
    "change": change == null ? null : change,
  };
}
