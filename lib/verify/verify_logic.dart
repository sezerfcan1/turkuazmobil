import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turkuazmobil/api_client/my_activity_api_client.dart';
import 'package:turkuazmobil/api_client/verify_api_client.dart';
import 'package:turkuazmobil/models/survey/my_activity_search.dart';
import 'package:turkuazmobil/models/survey/my_activity_surveys.dart';
import 'package:turkuazmobil/resources/constant.dart';

class VerifyLogic extends GetxController {
  VerifyLogic({@required this.verifySurveyApiClient,@required this.verifyImageApiClient,@required this.myActivityApiClient}) {
    getData();
  }
  final VerifySurveyApiClient verifySurveyApiClient;
  final VerifyImageApiClient verifyImageApiClient;
  final MyActivityApiClient myActivityApiClient;
  var selectedSurveyIndex = 0.obs;
  var search = MyActivitySearch(page: 0,rows: 10).obs;
  var loading = true.obs;
  var _isEmpty = false.obs;

  var myActivitySurveys = <MyActivitySurveys>[].obs;
  String token = Get.parameters['token'];
  String surveyId;

  get isEmpty => _isEmpty.value;

  Future<void> getData() async {

    try {
      loading(true);
      await myActivityApiClient.fetchMyActicitySurveys(search.value, token)
          .then((value) => myActivitySurveys.value = value);

      if (myActivitySurveys.value.length == 0) {
        loading(false);
        _isEmpty(true);
        Get.snackbar('Anket Yok', 'Veri tabanında aradığınız kriterlere uygun anket bulunamadı.',
          backgroundColor: Color(0x593265FF),);
      }else{
        loading(false);
      }
    } on SocketException {
      Get.back();
      Constant.showConnectError();
    } catch (_) {
      Get.back();
      Constant.unexpectedError();
    }
    finally{
      loading(false);
    }
  }
}
