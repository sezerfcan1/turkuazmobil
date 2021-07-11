import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:turkuazmobil/models/survey/survey.dart';
import 'dart:convert';
import '../resources/constant.dart';

class GetSurveyByIdApiClient {

  final http.Client httpClient;
  GetSurveyByIdApiClient({@required this.httpClient});

  Future<Survey> fetchSurvey({@required String token , @required String surveyId}) async{

    final surveyUrl = Constant.baseUrl + '/api/Surveys/'+surveyId ;

    final response = await httpClient.get(Uri.parse(surveyUrl),
        headers: {"Content-Type": "application/json",
          'Authorization': 'Bearer ' + token});
    if(response.statusCode == 200){
      final responseJson = jsonDecode(response.body);

      Survey model = Survey();
      model = Survey.fromJson(responseJson);
      return model;
    }else{
      throw Exception('Fail');
    }


  }
}
