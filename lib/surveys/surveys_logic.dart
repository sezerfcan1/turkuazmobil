import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turkuazmobil/api_client/search_api_client.dart';
import 'package:turkuazmobil/models/search/search.dart';
import 'package:turkuazmobil/models/search/surveys.dart';
import 'package:turkuazmobil/resources/constant.dart';
import 'package:turkuazmobil/resources/exception.dart';

class SurveysLogic extends GetxController {
  SurveysLogic({@required this.searchApiClient}) {
    getData();
  }

  final SearchApiClient searchApiClient;
  var selectedSurveyIndex = 0.obs;
  var search = Search(filter: Filter(), pagination: Pagination(page: 0, rows: 10)).obs;
  var _loading = true.obs;
  var _isEmpty = false.obs;
  var surveysMini = <SurveyMini>[].obs;
  String token = Get.parameters['token'];
  String surveyId;
  get loading => _loading.value;
  get isEmpty => _isEmpty.value;

  Future<void> getData() async {

    try {
      _loading(true);
      if(search.value.filter.title == null){
        search.value.filter = null;
      }else if(search.value.filter.title == '') {
        search.value.filter = null;
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
      _loading(false);
      Get.back();
      Constant.showConnectError();
    } on Unauthorized{
      _loading(false);
      Get.back();
      Constant.showUnauthorized();
    }
    catch (_) {
      _loading(false);
      Get.back();
      Constant.unexpectedError();
    }
  }
}
