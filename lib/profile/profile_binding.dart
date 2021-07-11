import 'package:get/get.dart';
import 'package:turkuazmobil/api_client/doctormyinfo_api_client.dart';
import 'package:http/http.dart' as http;
import 'profile_logic.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileLogic(doctorMyInfoApiClient: DoctorMyInfoApiClient(httpClient: http.Client())));
  }
}
