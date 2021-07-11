import 'package:get/get.dart';

import 'verify_logic.dart';

class VerifyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VerifyLogic());
  }
}
