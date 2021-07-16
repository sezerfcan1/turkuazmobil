import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:turkuazmobil/api_client/answer_get_api_client.dart';
import 'package:turkuazmobil/models/survey/answerbrought.dart';
import 'package:turkuazmobil/resources/constant.dart';
import 'package:turkuazmobil/resources/exception.dart';

class MyActivityImageLogic extends GetxController {
  MyActivityImageLogic({@required this.answerGetApiClient}){
    getData();
  }
  var choicesIndex = 0.obs;
  var surveyId = Get.parameters['surveyId'];
  var token = Get.parameters['token'];
  AnswerGetApiClient answerGetApiClient;
  var selectedChoiceId = 0.obs;
  var bottomNavigationBarSelectedItem = 0.obs;
  var loading = true.obs;
  var answerBrought = AnswerBrought().obs;

  getData()async{
    try {
      loading(true);
      answerBrought.value = await answerGetApiClient.fetchAnswerBrought(
          token: token, surveyId: surveyId);
      if (answerBrought.value.id != null) {
        loading(false);
      }
    }on SocketException {
      Constant.showConnectError();
      Get.back();
    }on BadRequest {
      Constant.showBadRequest();
      Get.back();
    }on Unauthorized{
      Constant.showUnauthorized();
      Get.back();
    }catch(_){
      Constant.showConnectError();
      Get.back();
    }finally{
      loading(false);
    }
  }



}
