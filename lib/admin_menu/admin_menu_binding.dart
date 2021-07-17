import 'package:get/get.dart';

import 'admin_menu_logic.dart';

class AdminMenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AdminMenuLogic());
  }
}
