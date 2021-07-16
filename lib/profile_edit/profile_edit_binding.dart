import 'package:get/get.dart';
import 'package:turkuazmobil/api_client/profile_edit_api_client.dart';
import 'package:http/http.dart' as http;
import 'profile_edit_logic.dart';

class ProfileEditBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileEditLogic(profileEditApiClient: ProfileEditApiClient(httpClient: http.Client())));
  }
}
