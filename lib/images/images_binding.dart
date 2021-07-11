import 'package:get/get.dart';
import 'package:turkuazmobil/api_client/survey_getById_api_client.dart';
import 'package:http/http.dart' as http;
import 'images_logic.dart';

class ImagesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ImagesLogic(getSurveyByIdApiClient: GetSurveyByIdApiClient(httpClient: http.Client())));
  }
}
