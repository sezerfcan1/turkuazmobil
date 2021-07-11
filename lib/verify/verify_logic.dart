import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turkuazmobil/api_client/verify_api_client.dart';

class VerifyLogic extends GetxController {
  VerifyLogic({@required this.verifySurveyApiClient,@required this.verifyImageApiClient}) {

  }
  final VerifyImageApiClient verifyImageApiClient;
  final VerifySurveyApiClient verifySurveyApiClient;

  var selectedSurveyIndex = 0.obs;
  //var search = Pagination(page: 0,rows: 1).obs;
  var _loading = true.obs;
  var _isEmpty = false.obs;
  //var myActivitySurveys = <MyActivitySurveys>[].obs;
  String token = Get.parameters['token'];
  String surveyId;
  get loading => _loading.value;
  get isEmpty => _isEmpty.value;
/*
  Future<void> getData() async {

    try {
      _loading(true);
      await myActivityApiClient
          .fetchMyActicitySurveys(search.value, Get.parameters['token'])
          .then((value) => myActivitySurveys.value = value);

      if (myActivitySurveys.value.length == 0) {
        _loading(false);
        _isEmpty(true);
        Get.snackbar('Anket Yok', 'Veri tabanında aradığınız kriterlere uygun anket bulunamadı.',
          backgroundColor: Color(0x593265FF),);
      }else{
        _loading(false);
      }
    } on SocketException {
      Get.back();
      Get.snackbar('Bağlantı Hatası', 'Sunucu ile bağlantı kurulamadı',
          backgroundColor: Colors.red, colorText: Colors.white);
    } catch (_) {
      Get.back();
      Get.snackbar('Üzgünüz', 'Bir hata oluştu',
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }*/
}
