import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:turkuazmobil/resources/constant.dart';
import 'package:turkuazmobil/models/survey/my_activity_search.dart';
import 'dart:convert';
import 'package:turkuazmobil/models/survey/my_activity_surveys.dart';


class MyActivityApiClient {
  final http.Client httpClient ;

  MyActivityApiClient({@required this.httpClient});

  Future<List<MyActivitySurveys>> fetchMyActicitySurveys(MyActivitySearch search,String token) async {
    final surveysUrl = Constant.baseUrl + '/api/Answers/myactivity';
    Map<String, dynamic> data = search.toJson();
    var dataJson = jsonEncode(data);
    var response;

    await httpClient.put(Uri.parse(surveysUrl),
        body: dataJson,
        headers: {"Content-Type": "application/json",
          'Authorization' : 'Bearer '+token}).then((value) => response = value);
    if(response.statusCode == 200){
      Iterable list = json.decode(response.body);
      var surveysMini= list.map((model) => MyActivitySurveys.fromJson(model)).toList();
      return surveysMini;
    } else {
      throw Exception('Fail');
    }
  }

}
