import 'dart:convert';
import 'package:turkuazmobil/models/survey/answer.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class SendSurveyApiClient{
  static const baseUrl = 'http://192.168.1.33:1000';
  final http.Client httpClient;
  SendSurveyApiClient({@required this.httpClient});


  Future<void> sendAnswer(String token,Answer answer) async {
    final url = baseUrl + '/api/Answers';

    Map<String, dynamic> data = answer.toJson();
    var dataJson = jsonEncode(data);

    final response = await httpClient.post(Uri.parse(url),
        body: dataJson,
        headers: {"Content-Type":"application/json",
          'Authorization': 'Bearer '+token});

    if(response.statusCode == 200) {
    }else{
      throw Exception('Fail');
    }


  }

}