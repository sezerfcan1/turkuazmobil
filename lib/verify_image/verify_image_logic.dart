import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turkuazmobil/models/survey/answer.dart' as ans;
import 'package:turkuazmobil/api_client/answer_get_api_client.dart';
import 'package:turkuazmobil/api_client/answer_send_api_client.dart';
import 'package:turkuazmobil/api_client/survey_getById_api_client.dart';
import 'package:turkuazmobil/edit/colored_point.dart';
import 'package:turkuazmobil/models/survey/answerbrought.dart';
import 'package:turkuazmobil/models/survey/survey.dart'as surv;
import 'package:turkuazmobil/resources/constant.dart';
import 'package:turkuazmobil/resources/exception.dart';
import 'package:http/http.dart' as http;

class VerifyImageLogic extends GetxController {
  VerifyImageLogic({@required this.answerGetApiClient, @required this.getSurveyByIdApiClient,@required this.sendSurveyApiClient}){
    getData();
  }
  SendSurveyApiClient sendSurveyApiClient;
  var cp = ColoredPoint().obs;
  var boxes = <Box>[].obs;
  GetSurveyByIdApiClient getSurveyByIdApiClient;
  var survey = surv.Survey().obs;
  var color = Color(0x00000000).obs;
  var minDistanceIndex = -1.obs;
  var choicesIndex = 0.obs;
  var surveyId = Get.parameters['surveyId'];
  var token = Get.parameters['token'];
  AnswerGetApiClient answerGetApiClient;
  var selectedChoiceId = 0.obs;
  var bottomNavigationBarSelectedItem = 0.obs;
  var loading = true.obs;
  var answerBrought = AnswerBrought().obs;
  Size size = Size(0,0);
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

  Future<void> getSurveyData() async {

    try{
      survey.value = await getSurveyByIdApiClient.fetchSurvey(token: token, surveyId: answerBrought.value.surveyId.toString());
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
    }

  }

  Future<void> sendData() async {
      try{
        ans.Answer answer = ans.Answer();
        answer.surveyId = int.parse(answerBrought.value.surveyId.toString());
        answer.choices = <ans.Choice>[];
        for(int imageIndex = 0 ; imageIndex < answerBrought.value.choices.length ; imageIndex++){

          if(cp.value.getBoxes().length != 0){
            answer.choices.add(
                ans.Choice(surveyImageId: answerBrought.value.choices[imageIndex].surveyImage.id ,boxes: cp.value.getBoxes() ));

          }

        }
        answer.creationAt = DateTime.now();
        SendSurveyApiClient sendSurveyApiClient = SendSurveyApiClient(httpClient: http.Client());
        sendSurveyApiClient.sendAnswer(token, answer);
        Get.snackbar('Değerli yorumlarınız teşekkürler.', 'Diğer anketlere katılmak için anketler sayfasına gidebilirsiniz.',snackPosition: SnackPosition.BOTTOM,duration: Duration(milliseconds: 3000),backgroundColor: Color(
            0x9014DE00),colorText: Color(0xFFFFFFFF));
      } on Unauthorized{
        Constant.showUnauthorized();
      }
      catch(_){
        Constant.showConnectError();
      }finally{

      }

  }




}
