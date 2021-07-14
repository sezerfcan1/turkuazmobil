import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:turkuazmobil/models/survey/answerbrought.dart';
import 'package:turkuazmobil/resources/exception.dart';
import 'dart:convert';
import '../resources/constant.dart';

class AnswerGetApiClient {

  final http.Client httpClient;
  AnswerGetApiClient({@required this.httpClient});

  Future<AnswerBrought> fetchAnswerBrought({@required String token , @required String surveyId}) async{

    final surveyUrl = Constant.baseUrl + '/api/Answers/'+surveyId ;

    final response = await httpClient.get(Uri.parse(surveyUrl),
        headers: {"Content-Type": "application/json",
          'Authorization': 'Bearer ' + token});
    if(response.statusCode == 200){
      final responseJson = jsonDecode(response.body);

      AnswerBrought model = AnswerBrought();
      model = AnswerBrought.fromJson(responseJson);
      return model;
    }else{
      throw BadRequest();
    }


  }
}
