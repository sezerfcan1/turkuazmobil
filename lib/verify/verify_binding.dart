import 'package:get/get.dart';
import 'package:turkuazmobil/api_client/my_activity_api_client.dart';
import 'package:turkuazmobil/api_client/verify_api_client.dart';
import 'package:http/http.dart' as http;
import 'verify_logic.dart';

class VerifyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VerifyLogic(verifySurveyApiClient: VerifySurveyApiClient(), verifyImageApiClient: VerifyImageApiClient(), myActivityApiClient:MyActivityApiClient(httpClient: http.Client() )));
  }
}
