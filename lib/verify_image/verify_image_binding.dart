import 'package:get/get.dart';
import 'package:turkuazmobil/api_client/answer_get_api_client.dart';
import 'package:http/http.dart' as http;
import 'package:turkuazmobil/api_client/answer_send_api_client.dart';
import 'package:turkuazmobil/api_client/survey_getById_api_client.dart';
import 'verify_image_logic.dart';

class VerifyImageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VerifyImageLogic(sendSurveyApiClient:  SendSurveyApiClient(httpClient: http.Client()),getSurveyByIdApiClient: GetSurveyByIdApiClient(httpClient: http.Client()),answerGetApiClient: AnswerGetApiClient(httpClient: http.Client())));
  }
}
