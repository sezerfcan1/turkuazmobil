import 'package:get/get.dart';
import 'package:turkuazmobil/api_client/admin_login_api_client.dart';
import 'package:turkuazmobil/api_client/login_api_client.dart';

import 'login_logic.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginLogic(loginApiClient: LoginApiClient(),adminLoginApiClient: AdminLoginApiClient()));
  }
}
