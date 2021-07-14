import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turkuazmobil/resources/constant.dart';
import 'package:turkuazmobil/api_client/login_api_client.dart';
import 'package:turkuazmobil/models/login/login.dart';
import 'package:turkuazmobil/models/login/login_info.dart';
import 'package:turkuazmobil/resources/exception.dart';

class LoginLogic extends GetxController {
  LoginLogic({@required this.loginApiClient});
  LoginApiClient loginApiClient;
  var _login = Login().obs;
  var _authenticated = false.obs;
  var _loading = false.obs;
  var _connection = false.obs;
  var _loginInfo = LoginInfo().obs;
  var _tooManyReq = false.obs;

  setLogin({@required String mail, @required String password}) async {

      _login.value.email = mail;
      _login.value.password = password;

        await getLoginInfo();

        if(_authenticated.value && _connection.value && !_loading.value) {
          var token = getToken();
          Get.offAllNamed('/MenuPage', parameters: {'token': '$token'});
          Constant.showLoginVerify();
        }
        else if (!_authenticated.value && _connection.value && !_loading.value && !_tooManyReq.value){
          Constant.showBadRequest();
        }
        else if (!_authenticated.value && !_connection.value && !_loading.value){
          Constant.showConnectError();
        }else if(!_authenticated.value && _connection.value && !_loading.value && _tooManyReq.value){
          Constant.showTooManyRequest();
        }
  }

  getLoading() {
    return _loading.value;
  }

  getToken() {
    return _loginInfo.value.token;
  }

  Future<void> getLoginInfo() async {

    try{
      _loading(true);
      _loginInfo.value = await loginApiClient.fetchLoginInfo(_login.value);
      if(_loginInfo.value.token != null){
        _loading(false);
        _connection(true);
        _authenticated(true);
      }

    } on SocketException {
      _loading(false);
      _authenticated(false);
      _connection(false);
    } on BadRequest {
      _loading(false);
      _authenticated(false);
      _connection(true);
    } on TooManyRequest{
      _loading(false);
      _authenticated(false);
      _connection(true);
      _tooManyReq(true);
    }catch(Exception) {
      _loading(false);
      _authenticated(false);
      _connection(true);
    } finally {
      _loading(false);
    }


  }



}
