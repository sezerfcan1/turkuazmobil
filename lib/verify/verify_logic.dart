import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turkuazmobil/api_client/verify_api_client.dart';

class VerifyLogic extends GetxController {
  VerifyLogic({@required this.verifySurveyApiClient,@required this.verifyImageApiClient}) {

  }
  final VerifySurveyApiClient verifySurveyApiClient;
  final VerifyImageApiClient verifyImageApiClient;
  var selectedSurveyIndex = 0.obs;
 // var search = Search(filter: Filter(), pagination: Pagination(page: 0, rows: 10)).obs;
  var _loading = true.obs;
  var _isEmpty = false.obs;
//  var surveysMini = <SurveyMini>[].obs;
  String token = Get.parameters['token'];
  String surveyId;
  get loading => _loading.value;
  get isEmpty => _isEmpty.value;

  Future<void> getData() async {
/*
    try {
      _loading(true);
     // if(search.value.filter.title == null){
    //    search.value.filter = null;
   //   }else if(search.value.filter.title == '') {
   //     search.value.filter = null;
      }
      await searchApiClient
          .fetchSurveys(search.value, Get.parameters['token'])
          .then((value) => surveysMini.value = value);

      if (surveysMini.value.length == 0) {
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
    }*/
  }
}
