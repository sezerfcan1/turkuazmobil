import 'dart:convert';

MyActivitySearch myActivitySearchFromJson(String str) => MyActivitySearch.fromJson(json.decode(str));

String myActivitySearchToJson(MyActivitySearch data) => json.encode(data.toJson());

class MyActivitySearch {
  MyActivitySearch({
    this.page,
    this.rows,
  });

  int page;
  int rows;

  factory MyActivitySearch.fromJson(Map<String, dynamic> json) => MyActivitySearch(
    page: json["page"] == null ? null : json["page"],
    rows: json["rows"] == null ? null : json["rows"],
  );

  Map<String, dynamic> toJson() => {
    "page": page == null ? null : page,
    "rows": rows == null ? null : rows,
  };
}
