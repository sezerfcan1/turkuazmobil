import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turkuazmobil/api_client/survey_getById_api_client.dart';
import 'package:turkuazmobil/edit/colored_point.dart';
import 'package:turkuazmobil/models/survey/answer.dart';
import 'package:turkuazmobil/models/survey/survey.dart';


class ImagesLogic extends GetxController {
  ImagesLogic({@required this.getSurveyByIdApiClient}){
    getSurveyData();
  }
  GetSurveyByIdApiClient getSurveyByIdApiClient;
  var pageController = PageController(initialPage: 0).obs;
  var selectedImageIndex = 0.obs;

  var currentIndex = 0.obs;
  String token = Get.parameters['token'];
  String surveyId = Get.parameters['surveyId'];
  var survey = Survey().obs;
  var answer = Answer().obs;
  var loading = true.obs;


  Future<void> getSurveyData()async {
    try {
      loading(true);
      await getSurveyByIdApiClient.fetchSurvey(token: token,surveyId: surveyId)
          .then((value) => survey.value = value);
      if (survey.value.title != null) {
        loading(false);
        survey.value.images.forEach((element) {
          element.cp = ColoredPoint();
        });
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



