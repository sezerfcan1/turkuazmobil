import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:turkuazmobil/resources/constant.dart';
import 'package:turkuazmobil/models/search/search.dart';
import 'dart:convert';
import 'package:turkuazmobil/models/search/surveys.dart';


class SearchApiClient {
  final http.Client httpClient ;

  SearchApiClient({@required this.httpClient});

  Future<List<SurveyMini>> fetchSurveys(Search search,String token) async {

    final surveysUrl = Constant.baseUrl + '/api/Surveys/search';
    //Search search = Search(filter: null,pagination:pagination );
    Map<String, dynamic> data = search.toJson();
    var dataJson = jsonEncode(data);
    var response;

    await httpClient.put(Uri.parse(surveysUrl),
        body: dataJson,
        headers: {"Content-Type": "application/json",
          'Authorization' : 'Bearer '+token}).then((value) => response = value);
    if(response.statusCode == 200){
      Iterable list = json.decode(response.body);
      var surveysMini= list.map((model) => SurveyMini.fromJson(model)).toList();

      return surveysMini;
    } else {
      throw Exception('Fail');
    }
  }

}
