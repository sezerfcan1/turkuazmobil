import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:turkuazmobil/models/login/login_info.dart';
import 'package:turkuazmobil/models/login/login.dart';
import 'package:turkuazmobil/resources/exception.dart';

import '../resources/constant.dart';

class LoginApiClient {

  final http.Client httpClient = http.Client();

  Future<LoginInfo> fetchLoginInfo(Login login) async {

    final tokenUrl = Constant.baseUrl + '/token/doctor';

    Map<String, dynamic> data = login.toJson();
    var dataJson = jsonEncode(data);

    var response = await httpClient.put(Uri.parse(tokenUrl), body: dataJson, headers: {"Content-Type": "application/json"});

      if (response.statusCode == 200) {
        final responseJson = jsonDecode(response.body);

        return LoginInfo.fromJson(responseJson);
      }else if (response.statusCode == 429){
        throw TooManyRequest();
      }else{
        throw BadRequest();
      }

  }
}
