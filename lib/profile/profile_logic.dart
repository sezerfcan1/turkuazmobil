import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turkuazmobil/api_client/doctormyinfo_api_client.dart';
import 'package:turkuazmobil/models/login/doctor_my_info.dart';
import 'package:turkuazmobil/resources/constant.dart';
import 'package:turkuazmobil/resources/exception.dart';

class ProfileLogic extends GetxController {
  ProfileLogic({@required this.doctorMyInfoApiClient}){
    getData();


  }
  final DoctorMyInfoApiClient doctorMyInfoApiClient;
  var myInfo = DoctorMyInfo().obs;
  var loading = true.obs;
  var token = Get.parameters['token'];
  var gender = 0.obs;

  Future<void> getData()async {
    try {
      loading(true);
      var response = await doctorMyInfoApiClient.fetchMyInfo(Get.parameters['token']);
      myInfo.value = response ;
      if (myInfo.value.name != null) {
        loading(false);
      }
    } on SocketException {
      loading(false);
      Get.back();
      Constant.showConnectError();
    } on Unauthorized{
      loading(false);
      Get.back();
      Constant.showUnauthorized();
    }
    catch (_) {
      loading(false);
      Get.back();
      Constant.unexpectedError();
    }
  }

}
