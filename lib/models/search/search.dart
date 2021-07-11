// To parse this JSON data, do
//
//     final search = searchFromJson(jsonString);

import 'dart:convert';

Search searchFromJson(String str) => Search.fromJson(json.decode(str));

String searchToJson(Search data) => json.encode(data.toJson());

class Search {
  Search({
    this.filter,
    this.pagination,
  });

  Filter filter;
  Pagination pagination;

  factory Search.fromJson(Map<String, dynamic> json) => Search(
    filter: json["filter"] == null ? null : Filter.fromJson(json["filter"]),
    pagination: json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]),
  );

  Map<String, dynamic> toJson() => {
    "filter": filter == null ? null : filter.toJson(),
    "pagination": pagination == null ? null : pagination.toJson(),
  };
}

class Filter {
  Filter({
    this.title,
    this.choiceGroupId,
    this.status,
    this.min,
    this.max,
  });

  String title;
  int choiceGroupId;
  int status;
  DateTime min;
  DateTime max;

  factory Filter.fromJson(Map<String, dynamic> json) => Filter(
    title: json["title"] == null ? null : json["title"],
    choiceGroupId: json["choiceGroupId"] == null ? null : json["choiceGroupId"],
    status: json["status"] == null ? null : json["status"],
    min: json["min"] == null ? null : DateTime.parse(json["min"]),
    max: json["max"] == null ? null : DateTime.parse(json["max"]),
  );

  Map<String, dynamic> toJson() => {
    "title": title == null ? null : title,
    "choiceGroupId": choiceGroupId == null ? null : choiceGroupId,
    "status": status == null ? null : status,
    "min": min == null ? null : min.toIso8601String(),
    "max": max == null ? null : max.toIso8601String(),
  };
}

class Pagination {
  Pagination({
    this.page,
    this.rows,
  });

  int page;
  int rows;

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
    page: json["page"] == null ? null : json["page"],
    rows: json["rows"] == null ? null : json["rows"],
  );

  Map<String, dynamic> toJson() => {
    "page": page == null ? null : page,
    "rows": rows == null ? null : rows,
  };
}
