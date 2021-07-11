import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:turkuazmobil/api_client/my_activity_api_client.dart';
import 'my_activity_logic.dart';

class MyActivityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyActivityLogic(myActivityApiClient: MyActivityApiClient(httpClient: http.Client())));
  }
}
