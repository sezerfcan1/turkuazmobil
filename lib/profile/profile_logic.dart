import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turkuazmobil/api_client/doctormyinfo_api_client.dart';
import 'package:turkuazmobil/models/login/doctor_my_info.dart';

class ProfileLogic extends GetxController {
  ProfileLogic({@required this.doctorMyInfoApiClient}){
    getData();
  }
  final DoctorMyInfoApiClient doctorMyInfoApiClient;
  var myInfo = DoctorMyInfo().obs;
  var _loading = true.obs;




  get loading => _loading.value;



  Future<void> getData()async {
    try {
      _loading(true);
      await doctorMyInfoApiClient.fetchMyInfo(Get.parameters['token'])
          .then((value) => myInfo.value = value);
      if (myInfo.value.name != null) {
        _loading(false);
      }
    } on SocketException {
      Get.back();
      Get.snackbar('Bağlantı Hatası',
          'Sunucu ile bağlantı kurulamadı', backgroundColor: Colors.red,
          colorText: Colors.white);
    }
    catch (_) {
      Get.back();
      Get.snackbar('Bağlantı Hatası',
          'Sunucu ile bağlantı kurulamadı', backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

}
