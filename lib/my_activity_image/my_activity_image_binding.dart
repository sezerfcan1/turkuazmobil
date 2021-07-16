import 'package:get/get.dart';
import 'package:turkuazmobil/api_client/answer_get_api_client.dart';
import 'package:http/http.dart' as http;
import 'my_activity_image_logic.dart';

class MyActivityImageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyActivityImageLogic(answerGetApiClient: AnswerGetApiClient(httpClient: http.Client())));
  }
}
