import 'package:get/get.dart';
import 'package:turkuazmobil/api_client/search_api_client.dart';
import 'package:http/http.dart' as http;
import 'surveys_logic.dart';

class SurveysBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SurveysLogic(searchApiClient: SearchApiClient(httpClient:http.Client() )));
  }
}
