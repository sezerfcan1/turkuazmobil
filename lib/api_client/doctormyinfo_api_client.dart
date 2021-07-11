import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:turkuazmobil/models/login/doctor_my_info.dart';
import '../resources/constant.dart';

class DoctorMyInfoApiClient {

  final http.Client httpClient;
  DoctorMyInfoApiClient({@required this.httpClient});

  Future<DoctorMyInfo> fetchMyInfo(String token) async{

      final myInfoUrl = Constant.baseUrl + '/api/Doctors/getmyinfo';

      final response = await httpClient.get(Uri.parse(myInfoUrl),
          headers: {"Content-Type": "application/json",
            'Authorization': 'Bearer ' + token});
      if(response.statusCode == 200){
        final responseJson = jsonDecode(response.body);

        DoctorMyInfo model = DoctorMyInfo();
        model = DoctorMyInfo.fromJson(responseJson);
        return model;
      }else{
        throw Exception('Fail');
      }


  }
}
