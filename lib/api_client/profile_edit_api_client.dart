import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:turkuazmobil/models/login/modify_password.dart';
import 'package:turkuazmobil/models/login/profile_edit.dart';
import 'package:turkuazmobil/resources/constant.dart';
import 'dart:convert';
import 'package:turkuazmobil/resources/exception.dart';

class ProfileEditApiClient {
  final http.Client httpClient;

  ProfileEditApiClient({@required this.httpClient});

  Future<bool> sendProfileEdit(ProfileInfo profileInfo, String token) async {
    final profileInfoUrl = Constant.baseUrl + '/api/Doctors/modifybasicinfo';
    Map<String, dynamic> data = profileInfo.toJson();
    var dataJson = jsonEncode(data);
    var response = await httpClient.put(Uri.parse(profileInfoUrl),
        body: dataJson,
        headers: {
          "Content-Type": "application/json",
          'Authorization': 'Bearer ' + token
        });

    if (response.statusCode == 200) {
      return false;
    } else {
      throw BadRequest();
    }
  }

  Future<bool> changePassword(
      ModifyPassword modifyPassword, String token) async {
    final modifyPasswordUrl = Constant.baseUrl + '/api/Doctors/modifypassword';
    Map<String, dynamic> data = modifyPassword.toJson();
    var dataJson = jsonEncode(data);

    var response = await httpClient.put(Uri.parse(modifyPasswordUrl),
        body: dataJson,
        headers: {
          "Content-Type": "application/json",
          'Authorization': 'Bearer ' + token
        });
    if (response.statusCode == 200) {
      return false;
    } else {
      throw BadRequest();
    }
  }

  Future<void> changeImage(String imagePath, String token) async {
    final imageUrl = Constant.baseUrl + '/api/Doctors/modifyimage';

    var formData = FormData.fromMap(
        {'file': await MultipartFile.fromFile(imagePath)});
    var response = await Dio().put(imageUrl,
        data: formData,
        options: Options(headers: <String, String>{
          'Authorization': 'Bearer $token',
        }));

  }
}
